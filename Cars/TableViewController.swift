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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return List.count
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let requset = NSFetchRequest(entityName: "CarList")
        
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        
        let data: NSManagedObject = List[indexPath.row] as! NSManagedObject
        
        cell.CellMake?.text = data.valueForKey("carmake") as? String
        cell.CellModel?.text = data.valueForKey("carmodel") as? String
        cell.CellYear?.text = data.valueForKey("caryear") as? String
        
        return cell
        
    }
}
