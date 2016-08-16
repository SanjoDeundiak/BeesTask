//
//  Beehive.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import Foundation

class BeehiveFactory {
    static let DefaultQueenNumber = 1
    static let DefaultWorkerNumber = 5
    static let DefaultDroneNumber = 8
    
    static func InstantiateDefaultBeehive() -> Beehive {
        return Beehive(queenBees: DefaultQueenNumber,
                       workerBees: DefaultWorkerNumber,
                       droneBees: DefaultDroneNumber)
    }
}

class Beehive {
    private var bees: [Bee]
    
    private init(queenBees: Int, workerBees: Int, droneBees: Int) {
        self.bees = [Bee]()
        
        let totalNumberOfBees = queenBees + workerBees + droneBees
        
        self.bees.reserveCapacity(totalNumberOfBees)
        
        for _ in 0..<queenBees {
            self.bees.append(QueenBee())
        }
        
        for _ in 0..<workerBees {
            self.bees.append(WorkerBee())
        }
        
        for _ in 0..<droneBees {
            self.bees.append(DroneBee())
        }
    }
    
    var beesCount: Int { return self.bees.count }
    func getBee(number index: Int) -> Bee {
        return self.bees[index]
    }
    
    private var hasDeadQueen: Bool {
        for bee in self.bees {
            if bee is QueenBee && bee.isDead {
                return true
            }
        }
        
        return false
    }
    
    private func killAll() {
        for bee in self.bees {
            bee.kill()
        }
    }
    
    private func updateState() {
        if self.hasDeadQueen {
            self.killAll()
        }
    }
    
    private func getRandomAliveBee() -> Bee? {
        return self.bees.filter({ !$0.isDead }).sample()
    }
    
    var isDown: Bool {
        return self.hasDeadQueen
    }
    
    func hitRandomBee() {
        self.getRandomAliveBee()?.gotHit()
        
        self.updateState()
    }
}