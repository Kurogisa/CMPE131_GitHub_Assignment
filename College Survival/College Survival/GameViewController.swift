//
//  GameViewController.swift
//  College Survival
//
//  Created by kenny ou on 2017/10/17.
//  Copyright © 2017年 kenny ou. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
    }
}
