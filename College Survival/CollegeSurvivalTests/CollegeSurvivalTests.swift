//
//  CollegeSurvivalTests.swift
//  CollegeSurvivalTests
//
//  Created by Sarah Mai on 11/9/17.
//  Copyright © 2017 kenny ou. All rights reserved.
//

import XCTest
@testable import College_Survival
var gameUnderTest: GenericNode!

class CollegeSurvivalTests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameUnderTest = GenericNode()
        gameUnderTest.collisionWithPlayer(player: <#SKNode#>)
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        gameUnderTest = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
