//
//  GameScene.swift
//  College Survival
//
//  Created by kenny ou on 2017/10/17.
//  Copyright © 2017年 kenny ou. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    var background:SKNode!
    var midground:SKNode!
    var foreground:SKNode!
    
    var hud:SKNode!
    
    var player:SKNode!
    
    var scaleFactor:CGFloat!
    
    var startButton = SKSpriteNode(imageNamed: "TapToStart")//game start button
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
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
    }
    
        override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
    }
}
