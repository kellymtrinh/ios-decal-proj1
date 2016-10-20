//
//  ViewController.swift
//  todoapp4
//
//  Created by KELLYTRINH on 10/19/16.
//  Copyright © 2016 KELLYTRINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var task : Task?
    var tasks = [Task]()
    @IBOutlet weak var tableView: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            navigationItem.title = "ToDo"
            let tableView = UITableView(frame: view.bounds)
            view.addSubview(tableView)
            self.tableView = tableView
            
            
            tableView.dataSource = self
            tableView.delegate = self
            
            self.edgesForExtendedLayout = UIRectEdge.top
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = "Back"
    }
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.source as! ChangeTaskViewController
        if sourceViewController.task != nil {
                print(sourceViewController.task?.taskName)
                print(tasks)
                tasks.append(sourceViewController.task!)
                print(tasks)
            }
        self.tableView.reloadData()
        
        }
    
    
        // Pull any data from the view controller which initiated the unwind segue.
    }
    
    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Getting the right element
            let oneTask = tasks[indexPath.row]
            
            let cellIdentifier = "TaskCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            
            cell.textLabel?.text = oneTask.taskName
            cell.detailTextLabel?.text = oneTask.taskStatus.rawValue
            
            // Returning the cell
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
}


