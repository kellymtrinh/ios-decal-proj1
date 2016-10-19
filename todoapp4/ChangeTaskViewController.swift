//
//  ChangeTaskViewController.swift
//  todoapp4
//
//  Created by KELLYTRINH on 10/19/16.
//  Copyright © 2016 KELLYTRINH. All rights reserved.
//

import UIKit

class ChangeTaskViewController: UIViewController {
    @IBOutlet weak var addTaskButton: UIButton!

    @IBOutlet weak var inputTaskField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        let tvc = nav.topViewController as! ViewController
        tvc.task = Task(taskName: inputTaskField.text!, dateCreated: Date() as NSDate, taskStatus: Task.Status(rawValue: "Incomplete")!)
//        tvc.tasks.append(Task(taskName: inputTaskField.text!, dateCreated: Date() as NSDate, taskStatus: Task.Status(rawValue: "Incomplete")!))
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
