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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do something with code
    }
    
    
    @IBAction func Save(sender: AnyObject) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let theContext: NSManagedObjectContext = AppDel.managedObjectContext
        let theEnt = NSEntityDescription.entityForName("CarList", inManagedObjectContext: theContext)
        let newItem = Model(entity: theEnt!, insertIntoManagedObjectContext: theContext)
        
        newItem.carmake = TextFieldCarMake.text!
        newItem.carmodel = TextFieldCarModel.text!
        newItem.caryear = TextFieldCarYear.text!
        
        do {
            try theContext.save()
        } catch _ {
            
        }
        
        self.navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
        
    }
    
    
}
