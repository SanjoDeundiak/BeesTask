//
//  TestViewController.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/17/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import XCTest
@testable import BeesTask

class TestViewController: TestCase {
    func testInstantiation() {
        let vc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateInitialViewController() as! ViewController
        
        // trigger view loading
        let _ = vc.view
    }
    
    func testSpam() {
        let vc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateInitialViewController() as! ViewController
        
        // trigger view loading
        let _ = vc.view
        
        // just some spam :)
        let object = NSObject()
        for _ in 0...1000 {
            vc.buttonPressed(object)
        }
    }
}