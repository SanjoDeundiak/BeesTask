//
//  BeeCell.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import Foundation
import UIKit

class BeeCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var hpLabel: UILabel!
    
    var name: String = "" {
        didSet {
            self.nameLabel.text = self.name
        }
    }
    
    var hp: Int = 0 {
        didSet {
            self.hpLabel.text = "\(self.hp)"
        }
    }
}