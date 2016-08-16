//
//  Bee.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import Foundation

let QueenBeeTotalPoints = 100
let QueenBeeHitRate = 8

let WorkerBeeTotalPoints = 75
let WorkerBeeHitRate = 10

let DroneBeeTotalPoints = 50
let DroneBeeHitRate = 12

class Bee {
    private(set) var hitPoints: Int
    
    var isDead: Bool {
        return self.hitPoints <= 0
    }
    
    private init(hitPoints: Int) {
        self.hitPoints = hitPoints
    }
    
    private func gotHit(byPoints points: Int) {
        self.hitPoints = max(self.hitPoints - points, 0)
    }
    
    func gotHit() { fatalError("Should override Bee::gotHit in subclass") }
    
    var name: String { fatalError("Should override Bee::gotHit in subclass") }
    
    func kill() {
        self.gotHit(byPoints: self.hitPoints)
    }
}

class QueenBee: Bee {
    init() {
        super.init(hitPoints: QueenBeeTotalPoints)
    }
    
    override func gotHit() {
        self.gotHit(byPoints: QueenBeeHitRate)
    }
    
    override var name: String {
        return NSLocalizedString("Queen Bee", comment: "Bee name")
    }
}

class WorkerBee: Bee {
    init() {
        super.init(hitPoints: WorkerBeeTotalPoints)
    }
    
    override func gotHit() {
        self.gotHit(byPoints: WorkerBeeHitRate)
    }
    
    override var name: String {
        return NSLocalizedString("Worker Bee", comment: "Bee name")
    }
}

class DroneBee: Bee {
    init() {
        super.init(hitPoints: DroneBeeTotalPoints)
    }
    
    override func gotHit() {
        self.gotHit(byPoints: DroneBeeHitRate)
    }
    
    override var name: String {
        return NSLocalizedString("Drone Bee", comment: "Bee name")
    }
}