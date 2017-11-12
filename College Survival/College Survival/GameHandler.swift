//
//  GameHandler.swift
//  College Survival
//
//  Created by Sarah Mai on 11/6/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import Foundation

class GameHandler
{
    var score: Int
    var highScore: Int
    var essayPage: Int
    
    class var sharedInstance: GameHandler
    {
        struct Singleton
        {
            static let instance = GameHandler()
        }
        return Singleton.instance
    }
    
    init()
    {
        score = 0
        highScore = 0
        essayPage = 0
        
        let userDefaults = UserDefaults.standard
        
        highScore = userDefaults.integer(forKey: "highScore")
        essayPage = userDefaults.integer(forKey: "essayPage")
        
    }
    
    func saveGameStats()
    {
        highScore = max(score, highScore)
        
        let defaults = UserDefaults.standard
        defaults.set(highScore, forKey: "highScore")
        defaults.set(essayPage, forKey: "essayPage")
        UserDefaults.standard.synchronize()
    }
}
