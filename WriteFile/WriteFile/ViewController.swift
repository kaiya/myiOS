//
//  ViewController.swift
//  WriteFile
//
//  Created by K.Yawn Xoan on 3/23/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var sp = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        if sp.count > 0 {
            var url = NSURL(fileURLWithPath: "\(sp[0])/data.txt")!
            
            println(url)
            
            //            var data = NSMutableData()
            //            data.appendData("Hello swift\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
            //            data.writeToFile(url.path!, atomically: true)
            //
            //            println("end")
            
            
            //
            //            var data = NSData(contentsOfURL: url.path!)
            //            var str = NSString(data: data, encoding: NSUTF8StringEncoding)
            //            println(str)
            var str1 = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
            println(str1)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

