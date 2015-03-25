//
//  ViewController.swift
//  UserDefault
//
//  Created by K.Yawn Xoan on 3/23/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    var ud = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ud = NSUserDefaults.standardUserDefaults()
        
        mySwitch.on = ud.boolForKey("showTips")
        
        if mySwitch.on{
            UIAlertView(title: "提示", message: "今天要下雨，记得带雨伞哦！", delegate: nil, cancelButtonTitle: "好的").show()
        }
       
    }

    @IBAction func switchValueChanged(sender: UISwitch) {
        
        ud.setBool(mySwitch.on, forKey: "showTips")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

