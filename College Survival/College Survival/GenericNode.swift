//
//  GenericNode.swift
//  College Survival
//
//  Created by Sarah Mai on 10/23/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

struct CollisionBitMask
{
    static let Player:UInt32 = 0x00
    static let Flower:UInt32 = 0x01
    static let Brick:UInt32 = 0x02
}

enum PlatformType:Int
{
    case normalBrick = 0
    case breakableBrick = 1
}
class GenericNode: SKNode
{
    func collisionWithPlayer (player:SKNode)->Bool
    {
        return false
    }
    
    func shouldRemoveNode (playerY:CGFloat)
    {
        if playerY>self.position.y + 300
        {
            self.removeFromParent()
        }
    }
}
