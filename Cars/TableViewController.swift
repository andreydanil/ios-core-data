//
//  TableViewController.swift
//  Cars
//
//  Created by Andrey Danilkovich on 6/13/16.
//  Copyright © 2016 Andrey Danilkovich. All rights reserved.
//

import UIKit
import CoreData


class TableViewController: UITableViewController {

    var List: Array<AnyObject> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Some code here
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
        return List.count
    }

    
    
    override func viewDidAppear(animated: Bool) {
        
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let request = NSFetchRequest(entityName: "CarList")
        
        List = try! Context.executeFetchRequest(request)
        tableView.reloadData()
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        
        let data: NSManagedObject = List[indexPath.row] as! NSManagedObject
        
        cell.CellMake?.text = data.valueForKey("carmake") as? String
        cell.CellModel?.text = data.valueForKey("carmodel") as? String
        cell.CellYear?.text = data.valueForKey("caryear") as? String
        
        return cell
        
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
        
        
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            Context.deleteObject(List[indexPath.row] as! NSManagedObject)
            List.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
        
        var error: NSError? = nil
        
        do {
            
            try Context.save()
            
        } catch let error1 as NSError {
            
            error = error1
            print(error)
            abort()
            
            
            
        }
        
        
        
    }
    
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "UpdateCell" {
            
            let selectedItem: NSManagedObject = List[self.tableView.indexPathForSelectedRow!.row] as! NSManagedObject
            
            let ViewCon: AddViewController = segue.destinationViewController as! AddViewController
            
            ViewCon.carmake = selectedItem.valueForKey("carmake") as! String
            ViewCon.carmodel = selectedItem.valueForKey("carmodel") as! String
            ViewCon.caryear = selectedItem.valueForKey("caryear") as! String
            
            ViewCon.existingItem = selectedItem
            
            
            
        }
        
        
    }
}
