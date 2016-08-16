//
//  TestArraySample.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/17/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import XCTest
@testable import BeesTask

class TestArraySample: TestCase {
    func testEmptyArray() {
        let array = [Int]()
        
        XCTAssert(array.sample() == nil)
    }
    
    func testSomeValue() {
        let array = [0, 1, 2, 3]
        
        XCTAssert(array.sample() != nil)
        XCTAssert(array.contains(array.sample()!))
    }
}