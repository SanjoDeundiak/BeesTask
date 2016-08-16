//
//  TestBehive.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import XCTest
@testable import BeesTask

class TestBeehive: TestCase {
    func testDefaultBehive() {
        let beehive = BeehiveFactory.InstantiateDefaultBeehive()
        
        XCTAssert(!beehive.isDown)
        XCTAssert(beehive.beesCount == 14)
        
        var queenCount = 0, workerCount = 0, droneCount = 0
        
        for i in 0..<beehive.beesCount {
            let bee = beehive.getBee(number: i)
            if bee is QueenBee {
                queenCount += 1
            }
            else if bee is WorkerBee {
                workerCount += 1
            }
            else if bee is DroneBee {
                droneCount += 1
            }
        }
        
        XCTAssert(queenCount == 1)
        XCTAssert(workerCount == 5)
        XCTAssert(droneCount == 8)
    }
    
    func testGuaranteedDeath() {
        let beehive = BeehiveFactory.InstantiateDefaultBeehive()

        let guaranteedDeathCount = 1 * Int(ceil(100.0 / 8)) + 5 * Int(ceil(75.0 / 10)) + 8 * Int(ceil(50.0 / 12))
        
        for _ in 0..<guaranteedDeathCount {
            beehive.hitRandomBee()
        }
        
        XCTAssert(beehive.isDown)
    }
    
    func testGuaranteedAlive() {
        let beehive = BeehiveFactory.InstantiateDefaultBeehive()
        
        let guaranteedAliveCount = 1 * Int(ceil(100.0 / 8)) - 1
        
        for _ in 0..<guaranteedAliveCount {
            beehive.hitRandomBee()
        }
        
        XCTAssert(!beehive.isDown)
    }
    
    func testKillQueen() {
        let beehive = BeehiveFactory.InstantiateDefaultBeehive()
        
        var queenBee: QueenBee!
        for i in 0..<beehive.beesCount {
            if let bee = beehive.getBee(number: i) as? QueenBee {
                queenBee = bee
                break
            }
        }
        
        queenBee.kill()
        
        XCTAssert(beehive.isDown)
    }
}