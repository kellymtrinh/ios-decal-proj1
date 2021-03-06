//
//  TableViewController.swift
//  todoapp4
//
//  Created by KELLYTRINH on 10/19/16.
//  Copyright © 2016 KELLYTRINH. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var task : Task?
    var tasks = [Task]()
    let hourInSeconds = 3600 //3600 seconds in an hour
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var timer = Timer.scheduledTimer(timeInterval: TimeInterval(hourInSeconds), target: self, selector: #selector(self.deleteOldTasks), userInfo: nil, repeats: true);
        //check every hour if any tasks are over a day old

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func unwindToTableViewController(segue: UIStoryboardSegue)
    {
        let sourceViewController = segue.source as! ChangeTaskViewController
        if sourceViewController.task != nil {
            tasks.append(sourceViewController.task!)
            deleteOldTasks()
        }
        self.tableView.reloadData()
    }
    
    func deleteOldTasks() {
        let dayInSeconds: Double = 86400 //delete tasks older than a day 86400 seconds
        var toRemove = [Int]()
        for (index, _) in tasks.enumerated() {
            if (tasks[index].taskStatus == Task.Status.Complete && (tasks[index].dateCompleted.timeIntervalSinceNow.rounded() >= dayInSeconds)) {
                toRemove.append(index)
            }
        }
        for index in toRemove {
            tasks.remove(at: index)
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDailyStats" {
            let dailyStatsVC = segue.destination as! DailyStatsViewController
            dailyStatsVC.tasks = tasks
        }
    }
    
        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowClicked = indexPath.row
        tasks[rowClicked].toggleStatus()
        self.tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: false)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
