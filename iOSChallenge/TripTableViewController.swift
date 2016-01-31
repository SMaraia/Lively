
//
//  TripTableViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/28/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        let navColor = UIColor(red: 255/255, green: 207/255, blue: 2/255, alpha: 1)
        UINavigationBar.appearance().barTintColor = navColor
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if(fileExists(FilePathInDocumentsDirectory(SAVED_FILE_NAME))){
            trips = NSKeyedUnarchiver.unarchiveObjectWithFile(FilePathInDocumentsDirectory(SAVED_FILE_NAME)) as! TripHolder
        }
        
        
        //sets the app up to save the favorites object when the app becomes inactive
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "saveData", name: UIApplicationWillResignActiveNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trips.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TripTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tripCell", forIndexPath: indexPath) as! TripTableViewCell
        let trip = trips[indexPath.row]
        // Configure the cell...
        cell.titleText!.text = trip.name
        if trip.moments.count > 0 {
            cell.imageOne!.image = trip.moments[0].image
        } else {
            cell.imageOne!.alpha = 1.0
        }
        
        if trip.moments.count > 1 {
            cell.imageTwo!.image = trip.moments[1].image
        } else {
            cell.imageOne!.alpha = 1.0
        }
        
        
        return cell
    }


    @IBAction func AddTapped(sender: AnyObject) {
        let alertView = UIAlertController(title: "Name of Trip", message: "", preferredStyle: .Alert)
        alertView.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "Vacation in Aruba"
        }
        let saveAction = UIAlertAction(title: "Done", style: .Default, handler: {alert -> Void in
            let tripName = alertView.textFields![0].text
            if(tripName != ""){
                let newTrip = Trip(name: tripName!)
                self.addTrip(newTrip)
            }
        })
        alertView.addAction(saveAction)
        self.presentViewController(alertView, animated: true, completion: nil)
    }

    func addTrip(newTrip: Trip) {
        trips.addTrip(newTrip)
        self.tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                (segue.destinationViewController as! TripViewController).tripIndex = indexPath.row
            }
        }
    }
    
    
    

}
