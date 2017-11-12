//
//  EndGame.swift
//  College Survival
//
//  Created by Sarah Lau on 11/8/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import SpriteKit

class EndGame: SKScene
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        let essayPage = SKSpriteNode(imageNamed: "essayPg_obj1")
        essayPage.position = CGPoint(x: 25, y: self.size.height - 30)
        addChild(essayPage)
        
        let essayPageLabel = SKLabelNode(fontNamed: "ChalkBoardSE-Bold")
        essayPageLabel.fontSize = 30
        essayPageLabel.fontColor = SKColor.white
        essayPageLabel.position = CGPoint(x: 50, y: self.size.height - 40)
        essayPageLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        essayPageLabel.text = String(format: "X %d", GameHandler.sharedInstance.essayPage)
        addChild(essayPageLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "ChalkBoardSE-Bold")
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width / 2, y: 300)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel.text = String(format: "%d", GameHandler.sharedInstance.score)
        addChild(scoreLabel)
        
        let highScoreLabel = SKLabelNode(fontNamed: "ChalkBoardSE-Bold")
        highScoreLabel.fontSize = 30
        highScoreLabel.fontColor = SKColor.cyan
        highScoreLabel.position = CGPoint(x: self.size.width / 2, y: 450)
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        highScoreLabel.text = String(format: "High Score %d", GameHandler.sharedInstance.highScore)
        addChild(highScoreLabel)
        
        let tryAgainLabel = SKLabelNode(fontNamed: "ChalkBoardSE-Bold")
        tryAgainLabel.fontSize = 30
        tryAgainLabel.fontColor = SKColor.white
        tryAgainLabel.position = CGPoint(x: self.size.width / 2, y: 50)
        tryAgainLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tryAgainLabel.text = "Tap to Play Again"
        addChild(tryAgainLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        self.view!.presentScene(gameScene, transition: transition)
    }
}
