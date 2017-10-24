//
//  GameElements.swift
//  College Survival
//
//  Created by Sarah Mai on 10/23/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

extension GameScene
{
    func createBackground() -> SKNode
    {
        let backgroundNode = SKNode()
        //let spacing = 64 * scaleFactor
        
        /*
        for index in 0 ... 19
        {
            let node = SKSpriteNode(imageNamed: String(format: "bkshlf_Backgrd_full", index + 1))
            node.setScale(scaleFactor)
            node.anchorPoint = CGPoint(x: 0.5, y: 0)
            node.position = CGPoint(x: self.size.width/2, y: spacing * CGFloat(index))
            
            backgroundNode.addChild(node)
        }
        */
        let node = SKSpriteNode(imageNamed: String(format: "bkshlf_Backgrd_full"))
        node.anchorPoint = CGPoint(x: -0.005, y: 0)
        backgroundNode.addChild(node)
        return backgroundNode
    }
    
    /*func createMidground() -> SKNode
    {
        let midgroundNode = SKNode()
        var anchor:CGPoint!
        var xPos:CGFloat!
        
        for index in 0 ... 9
        {
            var name:String
            
            let randomNumber = arc4random() % 2
            
            if randomNumber > 0
            {
                name = "closedBook_obj1"
                anchor = CGPoint(x:0, y:0.5)
                xPos = 0
            }
            else
            {
                name = "closedBook_obj2"
                anchor = CGPoint(x:1, y:0.5)
                xPos = self.size.width
            }
            
            let cloudNode = SKSpriteNode(imageNamed: name)
            cloudNode.anchorPoint = anchor
            cloudNode.position = CGPoint(x: xPos, y: 500*CGFloat(index))
            
            midgroundNode.addChild(cloudNode)
        }
        return midgroundNode
    }*/
    
    func createPlayer() -> SKNode
    {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: self.size.width/2, y: 100)
        
        let sprite = SKSpriteNode(imageNamed: "Chara_smaller")
        playerNode.addChild(sprite)
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width/2)
        
        playerNode.physicsBody?.isDynamic = false
        playerNode.physicsBody?.allowsRotation = false
        
        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.friction = 0
        playerNode.physicsBody?.angularDamping = 0
        playerNode.physicsBody?.linearDamping = 0
        
        playerNode.physicsBody?.usesPreciseCollisionDetection = true
        
        playerNode.physicsBody?.categoryBitMask = CollisionBitMask.Player
        
        playerNode.physicsBody?.collisionBitMask = 0
        playerNode.physicsBody?.contactTestBitMask = CollisionBitMask.Flower | CollisionBitMask.Brick
        
        return playerNode
    }
}
