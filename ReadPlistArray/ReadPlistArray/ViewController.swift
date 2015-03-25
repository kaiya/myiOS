//
//  ViewController.swift
//  ReadPlistArray
//
//  Created by K.Yawn Xoan on 3/23/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var arr = NSArray(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("arr", ofType: "plist")!)!)
        
       println(arr!)
        
        var dict = NSDictionary(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("data", ofType: "plist")!)!)
        
        println(dict!)
        var name:String = dict!["name"] as String
        println("name:\(name)")
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

