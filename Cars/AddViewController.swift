//
//  AddViewController.swift
//  Cars
//
//  Created by Andrey Danilkovich on 6/13/16.
//  Copyright © 2016 Andrey Danilkovich. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    @IBOutlet weak var TextFieldCarMake: UITextField!
    @IBOutlet weak var TextFieldCarModel: UITextField!
    @IBOutlet weak var TextFieldCarYear: UITextField!
    
    var carmake: String = ""
    var carmodel: String = ""
    var caryear: String = ""
    
    var existingItem: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do something with code
    }
    
    
    @IBAction func Save(sender: AnyObject) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let theContext: NSManagedObjectContext = AppDel.managedObjectContext
        let theEnt = NSEntityDescription.entityForName("CarList", inManagedObjectContext: theContext)
        
        
        if (existingItem != nil) {
            
            existingItem.setValue(TextFieldCarMake.text as String?, forKey: "carmake")
            existingItem.setValue(TextFieldCarModel.text as String?, forKey: "carmodel")
            existingItem.setValue(TextFieldCarYear.text as String?, forKey: "caryear")
            
        } else {
            
            let newitem = Model(entity: theEnt!, insertIntoManagedObjectContext: theContext)
            
            newitem.carmake = TextFieldCarMake.text!
            newitem.carmodel = TextFieldCarModel.text!
            newitem.caryear = TextFieldCarYear.text!
            
        }
        
        do {
            
            try theContext.save()
            
        } catch _ {
            
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    
    
}
