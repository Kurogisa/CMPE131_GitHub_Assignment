//
//  GameObjectNode.swift
//  College Survival
//
//  Created by Nvam Nguyen on 11/10/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

struct CollisionCategoryBitmask
{
    static let Player: UInt32 = 0x00
    static let EssayPage: UInt32 = 0x01
    static let Book: UInt32 = 0x02
}

class GameObjectNode: SKNode
{

    func collisionWithPlayer (player: SKNode)->Bool
    {
        return false //for now
    }
    
    func shouldRemoveNode (playerY: CGFloat)
    {
        if playerY > self.position.y + 300
        {
            self.removeFromParent()
        }
    }
}
