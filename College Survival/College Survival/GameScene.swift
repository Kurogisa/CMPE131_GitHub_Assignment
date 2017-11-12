//
//  GameScene.swift
//  College Survival
//
//  Created by kenny ou on 2017/10/17.
//  Copyright © 2017年 kenny ou. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate
{
    var background:SKNode!
    //var midground:SKNode!
    var foreground:SKNode!
    var hud:SKNode!
    var player:SKNode!
    
    var scaleFactor:CGFloat!
    
    let startButton = SKSpriteNode(imageNamed: "level_icon")
    
    var endLevelY = 0
    
    let motionManager = CMMotionManager()
    var xAcceleration:CGFloat = 0.0
    
    var scoreLabel: SKLabelNode!
    var essayPageLabel: SKLabelNode!
    
    var playersMaxY: Int!
    
    var gameOver = false
 
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize)
    {
        super.init(size: size)
        backgroundColor = SKColor.white
        
        playersMaxY = 80
        
        GameHandler.sharedInstance.score = 0
        gameOver = false
        
        scaleFactor = self.size.width / 320
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)
        physicsWorld.contactDelegate = self
        
        background = createBackgroundNode()
        addChild(background)
        
        /*our app does not have a mid ground
        midground = createMidground()
        addChild(midground)*/
        
        foreground = SKNode()
        addChild(foreground)
        
        hud = SKNode()
        addChild(hud)
        
        startButton.position = CGPoint(x: self.size.width / 2, y: 400)
        hud.addChild(startButton)
        
        let essayPage = SKSpriteNode(imageNamed: "essayPg_obj1")
        essayPage.position = CGPoint(x: 25, y: self.size.height - 30)
        hud.addChild(essayPage)
        
        essayPageLabel = SKLabelNode(fontNamed: "ChalkBoardSE-Bold")
        essayPageLabel.fontSize = 30
        essayPageLabel.fontColor = SKColor.white
        essayPageLabel.position = CGPoint(x: 50, y: self.size.height - 40)
        essayPageLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        essayPageLabel.text = String(format: "X %d", GameHandler.sharedInstance.essayPage)
        hud.addChild(essayPageLabel)
         
        scoreLabel = SKLabelNode(fontNamed: "ChalkBoardSE-Bold")
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width - 20, y: self.size.height - 40)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
         
        scoreLabel.text = "0"
        hud.addChild(scoreLabel)
        
        motionManager.accelerometerUpdateInterval = 0.2
        
        //**********************************************************************
        /*
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler:
        {
            (accelerometerData: CMAccelerometerData!, error: NSError!)-> Void in
            //let accelerometerData = data
            let acceleration = accelerometerData.acceleration
            self.xAcceleration = (CGFloat(acceleration.x) * 0.75 + (self.xAcceleration * 0.25))
        } as! CMAccelerometerHandler)
        */
        //**********************************************************************
        
 
        //created our player
        player = createPlayer()
        foreground.addChild(player)

        let levelPlist = Bundle.main.path(forResource: "Level01", ofType: "plist")
        let levelData = NSDictionary(contentsOfFile: levelPlist!)!
        
        endLevelY = (levelData["EndY"]! as AnyObject).integerValue!
        
        /*let platform = createPlatformAtPosition(position: CGPoint(x: 160, y: 320), ofType: PlatformType.normalBook)
        foreground.addChild(platform)*/
 
        let platforms = levelData["Platforms"] as! NSDictionary
        let platformPatterns = platforms["Patterns"] as! NSDictionary
        let platformPositions = platforms["Positions"] as! [NSDictionary]
        
        for platformPosition in platformPositions
        {
            let x = (platformPosition["x"] as AnyObject).floatValue
            let y = (platformPosition["y"]as AnyObject).floatValue
            let pattern = platformPosition["pattern"] as! NSString
            
            let platformPattern = platformPatterns[pattern] as! [NSDictionary]
            for platformPoint in platformPattern
            {
                let xValue = (platformPoint["x"] as AnyObject).floatValue
                let yValue = (platformPoint["y"] as AnyObject).floatValue
                let type = PlatformType(rawValue: (platformPoint["type"] as AnyObject).integerValue)
                let xPosition = CGFloat(xValue! + x!)
                let yPosition = CGFloat(yValue! + y!)
                
                let platformNode = createPlatformAtPosition(position: CGPoint(x: xPosition, y: yPosition),ofType: type!)
                foreground.addChild(platformNode)
            }
        }
        
        /*let EssayPage = createEssayPageAtPosition(position: CGPoint(x: 160, y: 220)/*, ofType: EssayPageType.NormalEssayPage*/)
        foreground.addChild(EssayPage)*/
 
        let essayPages = levelData["Stars"] as! NSDictionary
        let essayPagePatterns = essayPages["Patterns"] as! NSDictionary
        let essayPagePositions = essayPages["Positions"] as! [NSDictionary]
        
        for essayPagePosition in essayPagePositions
        {
            let x = (essayPagePosition["x"] as AnyObject).floatValue
            let y = (essayPagePosition["y"] as AnyObject).floatValue
            let pattern = essayPagePosition["pattern"] as! NSString
            
            let essayPagePattern = essayPagePatterns[pattern] as! [NSDictionary]
            for essayPagePoint in essayPagePattern
            {
                let xValue = (essayPagePoint["x"] as AnyObject).floatValue
                let yValue = (essayPagePoint["y"] as AnyObject).floatValue
                //let type = EssayPageType(rawValue: (essayPagePoint["type"] as AnyObject).integerValue)
                let xPosition = CGFloat(xValue! + x!)
                let yPosition = CGFloat(yValue! + y!)
                
                let essayPageNode = createEssayPageAtPosition(position: CGPoint(x: xPosition, y: yPosition)/*,ofType: type!*/)
                foreground.addChild(essayPageNode)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if player.physicsBody!.isDynamic
        {
            return
        }
        
        startButton.removeFromParent()
        
        player.physicsBody?.isDynamic = true
    
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 60))
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        var updateHUD = false

        let whichNode = (contact.bodyA.node != player) ? contact.bodyA.node : contact.bodyB.node
        let other = whichNode as! GenericNode
        
        updateHUD = other.collisionWithPlayer(player: player)
        
        if updateHUD
        {
            essayPageLabel.text = String(format: "X %d", GameHandler.sharedInstance.essayPage)
            scoreLabel.text = String(format: "%d", GameHandler.sharedInstance.score)
        }
    }

    override func update(_ currentTime: TimeInterval)
    {
        if gameOver
        {
            return
        }
        
        if Int(player.position.y) > playersMaxY
        {
            GameHandler.sharedInstance.score += Int(player.position.y) - playersMaxY!
            playersMaxY = Int(player.position.y)
            scoreLabel.text = String(format: "%d", GameHandler.sharedInstance.score)
        }
            
        foreground.enumerateChildNodes(withName: "PLATFORMNODE", using:
        {
            (node, stop) -> Void in
            let platform = node as! PlatformNode
            platform.shouldRemoveNode(playerY: self.player.position.y)
        })
            
        foreground.enumerateChildNodes(withName: "ESSAYPAGENODE", using:
        {
            (node, stop) -> Void in
            let essayPage = node as! EssayPageNode
            essayPage.shouldRemoveNode(playerY: self.player.position.y)
        })
            
        if player.position.y > 200
        {
            background.position = CGPoint(x: 0, y: -((player.position.y - 200)/10))
            //midground.position = CGPoint(x: 0, y: -((player.position.y - 200)/4))
            foreground.position = CGPoint(x: 0, y: -(player.position.y - 200))
        }
        
        if Int(player.position.y) > endLevelY
        {
            endGame()
        }
            
        if Int(player.position.y) < playersMaxY - 800
        {
            endGame()
        }
    }
    
    override func didSimulatePhysics()
    {
        player.physicsBody?.velocity = CGVector(dx: xAcceleration * 400, dy: player.physicsBody!.velocity.dy)
        if player.position.x < -20
        {
            player.position = CGPoint(x: self.size.width + 20, y: player.position.y)
        }
        else if (player.position.x > self.size.width + 20)
        {
            player.position = CGPoint (x: -20, y: player.position.y)
        }
    }

    func endGame()
    {
        gameOver = true
        GameHandler.sharedInstance.saveGameStats()
        
        let transition = SKTransition.fade(withDuration: 0.5)
        let endGameScene = EndGame(size: self.size)
        self.view!.presentScene(endGameScene, transition: transition)
    }
 }
