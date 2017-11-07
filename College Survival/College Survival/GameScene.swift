//
//  GameScene.swift
//  College Survival
//
//  Created by kenny ou on 2017/10/17.
//  Copyright © 2017年 kenny ou. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {

    var background:SKNode!
    var midground:SKNode!
    var foreground:SKNode!
    
    var hud:SKNode!
    
    var player:SKNode!
    
    var scaleFactor:CGFloat!
    
    var startButton = SKSpriteNode(imageNamed: "level_icon")//game start button
    var endofGamePosition = 0
    
    let motionManager = CMMotionManager()
    
    var xAcceleration:CGFloat = 0.0
    
    var scoreLabel:SKLabelNode!
    var flowerLabel:SKLabelNode!
    
    var playersMaxY:Int!
    
    var gameOver = false
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize)
    {
        super.init(size: size)
        backgroundColor = SKColor.white
        
        scaleFactor = self.size.width / 320
        
        /*_________________starting to add after problem_(video = 1:03:30)_____________________*/
        let levelData = GameHandler.sharedInstance.levelData
        /*_________________starting to add after problem_(video = 1:03:30)_____________________*/
        
        
        background = createBackground()
        addChild(background)
        
        //our app does not have a mid ground
        /*background = createMidground()
        addChild(midground)*/
        
        foreground = SKNode()
        addChild(foreground)
        
        //created our player
        player = createPlayer()
        foreground.addChild(player)
        
        /*_________________starting to add after problem_(video = 1:05:47)_____________________*/
        //errased and replaced in (1:05:47)
        //let platform = createPlatformAtPosition(position: CGPoint(x:160, y:320), ofType: PlatformType.normalBrick)
        //foreground.addChild(platform)
        let platforms = levelData["Platforms"] as! NSDictionary
        let platformPatterns = platforms["Patterns"] as! NSDictionary
        let platformPositions = platform
        
        for platformPositions in platformPositions
        {
            let x = platformPosition["x"]?.flo
            //go to video part (1:12:13) HERE!!!!!!!!!
        }
        /*_________________starting to add after problem_(video = 1:05:47)_____________________*/

        
        let EssayPage = createEssayPageAtPosition(position: CGPoint(x: 160, y: 220),ofType: EssayPageType.NormalEssayPage)
        foreground.addChild(EssayPage)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)
        physicsWorld.contactDelegate = self
        
        /*_________________starting to add after problem_(video = 53:30)_______________________*/
        motionManager.accelerometerUpdateInterval = 0.2
        
        //ERROR #2
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue())
        {
            (data: CMAccelerometerData?, error:NSError?)-> Void in
            if let accelerometerData = Data
            {
                let acceleration = accelerometerData.acceleration
                self.xAcceleration = (CGFloat(acceleration.x)*0.75 + (self.xAcceleration * 0.25))
            }
        }
        /*_________________starting to add after problem_(video = 53:30)_______________________*/
    }
    
    func didBeginConcat(contact:SKPhysicsContact)
    {
        var otherNode:SKNode!
        
        if contact.bodyA.node != player
        {
            otherNode = contact.bodyA.node
        }
        else
        {
            otherNode = contact.bodyB.node
        }
        (otherNode as! GenericNode).collisionWithPlayer(player: player)
        
    }
    /*_________________starting to add after problem_(video = 55:48)_______________________*/
    
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
    /*_________________starting to add after problem_(video = 55:48)_______________________*/
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        player.physicsBody?.isDynamic = true
        
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 40))

    }
    
        override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
    }
}

