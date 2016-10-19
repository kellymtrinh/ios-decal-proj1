//
//  Task.swift
//  todoapp4
//
//  Created by KELLYTRINH on 10/19/16.
//  Copyright © 2016 KELLYTRINH. All rights reserved.
//

import Foundation

struct Task {
    enum Status: String {
        case Complete, Incomplete
    }
    
    let taskName: String
    let dateCreated: NSDate
    let taskStatus: Status
}
