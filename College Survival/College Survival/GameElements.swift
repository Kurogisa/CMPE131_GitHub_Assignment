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
    func createBackgroundNode() -> SKNode
    {
        let backgroundNode = SKNode()
        //If our background came in parts
        //let spacing = 64 * scaleFactor
        //scaling is not needed ... maybe?
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
    
    //midground not need for our design
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
            cloudNode.position = CGPoint(x: xPos, y: 500 * CGFloat(index))
            
            midgroundNode.addChild(cloudNode)
        }
        return midgroundNode
    }*/
    
    func createPlayer() -> SKNode
    {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: self.size.width/2, y: 80)
        
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
        playerNode.physicsBody?.categoryBitMask = CollisionCategoryBitmask.Player
        playerNode.physicsBody?.collisionBitMask = 0
        playerNode.physicsBody?.contactTestBitMask = CollisionCategoryBitmask.EssayPage | CollisionCategoryBitmask.Book
        
        return playerNode
    }
    
    func createPlatformAtPosition (position:CGPoint, ofType type:PlatformType) -> PlatformNode
    {
        let node = PlatformNode()
        let thePosition = CGPoint(x: position.x * scaleFactor, y: position.y)
        node.position = thePosition
        node.name = "PLATFORMNODE"
        node.platformType = type
        
        var sprite:SKSpriteNode
        if type == PlatformType.normalBook
        {
            sprite = SKSpriteNode(imageNamed: "closedBook_obj1")//should stays solid after stepped on
        }
        else
        {
            sprite = SKSpriteNode(imageNamed: "old_book") // should disapears after stepped on
        }
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        node.physicsBody?.isDynamic = false //so it does not react to gravity and fall
        node.physicsBody?.categoryBitMask = CollisionCategoryBitmask.Book
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
    
    func createEssayPageAtPosition (position: CGPoint/*, ofType type:EssayPageType*/) -> EssayPageNode
    {
        let node = EssayPageNode()
        let thePosition = CGPoint(x: position.x * scaleFactor, y: position.y)
        node.position = thePosition
        node.name = "ESSAYPAGENODE"
        //node.essayPageType = type
        
        var sprite: SKSpriteNode
        sprite = SKSpriteNode(imageNamed: "essayPg_obj1")
        
        //If we have two types of essay pages
        /*if type == EssayPageType.NormalEssayPage
        {
            sprite = SKSpriteNode(imageNamed: "essayPg_obj1")
        }
        else
        {
            sprite = SKSpriteNode(imageNamed: "essayPg_obj2")
        }*/
        
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width/2)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionCategoryBitmask.EssayPage
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }

}
