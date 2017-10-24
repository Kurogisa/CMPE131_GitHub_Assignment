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

class GameScene: SKScene
{
    var background:SKNode!
    var midground:SKNode!
    var foreground:SKNode!
    
    var hud:SKNode!
    
    var player:SKNode!
    
    var scaleFactor:CGFloat!
    
    var startButton = SKSpriteNode(imageNamed: "level_icon")//game start button
    var endofGamePosition = 0
    
    let montionManager = CMMotionManager()
    
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
<<<<<<< HEAD
        let EssayPage = createEssayPageAtPosition(position: CGPoint(x: 160, y: 220),ofType: EssayPageType.NormalEssayPage)
            foreground.addChild(EssayPage)
=======
        
        let EssayPage = createEssayPageAtPosition(position: CGPoint(x:160, y:220), ofType: EssayPageType.NormalEssayPage)
        foreground.addChild(EssayPage)
>>>>>>> d0660027d2d63203ae491c8865a8eea4f2c8c161
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        player.physicsBody?.isDynamic = true
<<<<<<< HEAD
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))
=======
        player.physicsBody?.applyImpulse(CGVector(dx:0, dy:20))
>>>>>>> d0660027d2d63203ae491c8865a8eea4f2c8c161
    }
    
        override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
    }
}
