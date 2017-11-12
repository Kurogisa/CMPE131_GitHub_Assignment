//
//  PlatformNode.swift
//  College Survival
//
//  Created by Sarah Mai on 10/23/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

class PlatformNode: GenericNode
{
    var platformType:PlatformType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool
    {
        if CGFloat((player.physicsBody?.velocity.dy)!) < 0
        {
            player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 400)
            
            if platformType == PlatformType.breakableBook
            {
                self.removeFromParent()
            }
        }
        return false
    }

}
