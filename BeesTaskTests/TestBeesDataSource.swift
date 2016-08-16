//
//  TestBeesDataSource.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/17/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import XCTest
@testable import BeesTask

class TestBeesDataSource: TestCase {
    func testCellConfiguration() {
        let bees = [QueenBee(), WorkerBee(), DroneBee()]
        
        let dataSource = BeesDataSource()
        dataSource.countAccessor = { return bees.count }
        dataSource.elementAccessor = { (index: Int) in
            return bees[index]
        }
        
        let tableView = UITableView()
        tableView.registerNib(UINib(nibName: "BeeCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "BeeCell")
        
        for i in 0..<bees.count {
            let cell = dataSource.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: i, inSection: 0)) as! BeeCell
            XCTAssert(cell.name == bees[i].name)
            XCTAssert(cell.hp == bees[i].hitPoints)
        }
    }
}