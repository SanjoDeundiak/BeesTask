//
//  ViewController.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var actionButton: UIButton!
    
    static let BeeCellId = "BeeCell"

    private var beehive: Beehive! {
        didSet {
            self.updateState()
        }
    }
    
    private var dataSource: BeesDataSource!
    
    private func updateState() {
        if self.beehive.isDown {
            self.actionButton.setTitle(NSLocalizedString("Restart", comment: "Main Screen Action Button"), forState: .Normal)
        }
        else {
            self.actionButton.setTitle(NSLocalizedString("Kill", comment: "Main Screen Action Button"), forState: .Normal)
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: ViewController.BeeCellId, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: ViewController.BeeCellId)
        
        self.beehive = BeehiveFactory.InstantiateDefaultBeehive()
        
        self.dataSource = BeesDataSource()
        self.dataSource.countAccessor = { [unowned self] in self.beehive.beesCount }
        self.dataSource.elementAccessor = { [unowned self] (index: Int) in
            return self.beehive.getBee(number: index)
        }
        
        self.tableView.dataSource = self.dataSource
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if self.beehive.isDown {
            self.beehive = BeehiveFactory.InstantiateDefaultBeehive()
        }
        else {
            self.beehive.hitRandomBee()
            self.updateState()
        }
    }
}

