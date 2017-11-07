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
    var score:Int
    var highScore:Int
    var flowers:Int
    
    var levelData:NSDictionary!
    
    class var sharedInstances:GameHandler
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
        flowers = 0
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        highScore = userDefaults.integerForKey("highScore")
        flowers = userDefaults.integerForKey("flowers")
        
        if let path = NSbundle.mainBundle().pathForResources("Level01", ofType: "plist")
        {
            if let level = NSDictionary(contentsOfFile: path)
            {
                levelData = level
            }
        }
        
    }
    
    func saveGameStats()
    {
        highScore = max(score,highScore)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(highScore, forKey: "highScore")
        userDefaults.setInteger(flowers, forKey: "flowers")
        userDefaults.synchronize()
    }
}
