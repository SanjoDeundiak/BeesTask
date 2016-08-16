//
//  TestBees.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import XCTest
@testable import BeesTask

class TestBees: TestCase {
    func testQueenBee() {
        let queenBee = QueenBee()
        
        XCTAssert(queenBee.name == "Queen Bee")
        XCTAssert(queenBee.hitPoints == 100)
        
        queenBee.gotHit()
        
        XCTAssert(queenBee.hitPoints == 100 - 8)
        
        queenBee.kill()
        
        XCTAssert(queenBee.hitPoints == 0)
        XCTAssert(queenBee.isDead)
    }
    
    func testWorkerBee() {
        let queenBee = WorkerBee()
        
        XCTAssert(queenBee.name == "Worker Bee")
        XCTAssert(queenBee.hitPoints == 75)
        
        queenBee.gotHit()
        
        XCTAssert(queenBee.hitPoints == 75 - 10)
        
        queenBee.kill()
        
        XCTAssert(queenBee.hitPoints == 0)
        XCTAssert(queenBee.isDead)
    }
    
    func testDroneBee() {
        let queenBee = DroneBee()
        
        XCTAssert(queenBee.name == "Drone Bee")
        XCTAssert(queenBee.hitPoints == 50)
        
        queenBee.gotHit()
        
        XCTAssert(queenBee.hitPoints == 50 - 12)
        
        queenBee.kill()
        
        XCTAssert(queenBee.hitPoints == 0)
        XCTAssert(queenBee.isDead)
    }
}