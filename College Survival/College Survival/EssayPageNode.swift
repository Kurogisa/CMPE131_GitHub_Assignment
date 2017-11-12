//
//  EssayPageNode.swift
//  College Survival
//
//  Created by Sarah Mai on 10/23/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

class EssayPageNode: GenericNode
{
    //var essayPageType: EssayPageType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool
    {
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 450)
        
        self.removeFromParent()
        
        GameHandler.sharedInstance.score += 20
        //If we have two types of essayPages
        //GameHandler.sharedInstances.score += (EssayPageType == essayPage.normalEssayPage ? 20 : 100)
        
        GameHandler.sharedInstance.essayPage += 1
        //If we  have two types of essayPages
        //GameHandler.sharedInstances.essayPage += (EssayPageType == essayPage.normalEssayPage ? 1 : 5)
        
        return true
    }
}
