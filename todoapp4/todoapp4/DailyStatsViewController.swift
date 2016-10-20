//
//  DailyStatsViewController.swift
//  todoapp4
//
//  Created by KELLYTRINH on 10/19/16.
//  Copyright © 2016 KELLYTRINH. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {

    @IBOutlet weak var numTasksCompleted: UILabel!
    var tasks = [Task]()
    var completed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Tasks Completed Today"
        findNumCompletedTasks()
        numTasksCompleted.text = completed.description
                // Do any additional setup after loading the view.
    }

    func findNumCompletedTasks() {
        let dayInSeconds: Double = 86400
        for task in tasks {
            if (task.taskStatus == Task.Status.Complete && (task.dateCompleted.timeIntervalSinceNow.rounded() <= dayInSeconds)) {
                completed += 1
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
