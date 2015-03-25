//
//  ViewController.swift
//  UsingData
//
//  Created by K.Yawn Xoan on 3/23/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
        
        var row:AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context!)

        row.setValue("jikexueyuan", forKey: "name")
        row.setValue(1, forKey: "age")
        context?.save(nil)
        println("Run here")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

