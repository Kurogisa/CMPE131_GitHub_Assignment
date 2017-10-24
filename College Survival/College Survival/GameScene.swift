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
        
        background = createBackground()
        addChild(background)
        
        /*background = createMidground()
        addChild(midground)*/
        
        foreground = SKNode()
        addChild(foreground)
        
        player = createPlayer()
        foreground.addChild(player)
        
        let platform = createPlatformAtPosition(position: CGPoint(x:160, y:320), ofType: PlatformType.normalBrick)
        foreground.addChild(platform)
        let EssayPage = createEssayPageAtPosition(position: CGPoint(x: 160, y: 220),ofType: EssayPageType.NormalEssayPage)
        foreground.addChild(EssayPage)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)
        physicsWorld.contactDelegate = self
        
        motionManager.accelerometerUpdateInterval = 0.2
        
        /*
        motionManager.startAccelerometerUpdatesToQueue(OperationQueue.currentQueue()!) { (data:CMAccelerometerData?, error:NSError?)-> Void in
            if let accelerometerData = Data
            {
                let acceleration = accelerometerData.acceleration
                self.xAcceleration = (CGFloat(acceleration.x)*0.75 + (self.xAcceleration * 0.25))
            }
        }*/
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
        /*
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
        }*/
    
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

