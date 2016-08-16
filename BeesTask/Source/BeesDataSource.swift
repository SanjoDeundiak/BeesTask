//
//  BeesDataSource.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import Foundation
import UIKit

class BeesDataSource: NSObject, UITableViewDataSource {
    var countAccessor: (()->Int)!
    var elementAccessor: ((Int)->Bee)!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countAccessor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ViewController.BeeCellId) as! BeeCell
        
        let bee = self.elementAccessor(indexPath.row)
        
        cell.name = bee.name
        cell.hp = bee.hitPoints
        
        return cell
    }
}