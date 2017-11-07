//
//  EssayPageNode.swift
//  College Survival
//
//  Created by Sarah Mai on 10/23/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

enum EssayPageType:Int
{
    case NormalEssayPage = 0
    case SpecialEssayPage = 1
}

class EssayPageNode: GenericNode
{
    var essayPageType:EssayPageType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool
    {
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 400)
        
        self.removeFromParent()
        
        return true
    }
}
