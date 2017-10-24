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
}
