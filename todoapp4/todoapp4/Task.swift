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
    var taskStatus: Status
    var dateCompleted: NSDate
    
    mutating func toggleStatus() {
        if taskStatus == Status.Complete {
            taskStatus = Status.Incomplete
            dateCompleted = NSDate()
        }
        
        else if taskStatus == Status.Incomplete {
            taskStatus = Status.Complete
            dateCompleted = NSDate()
        }
        
    }
}
