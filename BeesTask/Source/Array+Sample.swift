//
//  Array+Sample.swift
//  BeesTask
//
//  Created by Oleksandr Deundiak on 8/16/16.
//  Copyright © 2016 Oleksandr Deundiak. All rights reserved.
//

import Foundation

extension Array {
    func sample() -> Element? {
        guard self.count != 0 else {
            return nil
        }
        
        let randomIndex = Int(rand()) % self.count
        return self[randomIndex]
    }
}