//
//  GenericNode.swift
//  College Survival
//
//  Created by Sarah Mai on 10/23/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

struct CollisionCategoryBitmask
{
    static let Player: UInt32 = 0x00
    static let EssayPage: UInt32 = 0x01
    static let Book: UInt32 = 0x02
}

/*If we have two types of essay pages
enum EssayPageType:Int
{
case NormalEssayPage = 0
case SpecialEssayPage
}*/

enum PlatformType: Int
{
    case normalBook = 0
    case breakableBook
}

class GenericNode: SKNode
{
    func collisionWithPlayer (player: SKNode)->Bool
    {
        return false
    }
    
    func shouldRemoveNode (playerY: CGFloat)
    {
        if playerY > self.position.y + 300
        {
            self.removeFromParent()
        }
    }
}
