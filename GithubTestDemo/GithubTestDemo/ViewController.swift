//
//  ViewController.swift
//  GithubTestDemo
//
//  Created by K.Yawn Xoan on 3/13/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func closeConfirm(sender: UIButton) {
        
         UIAlertView(title: "确认关闭？", message: "确认关闭当前窗口吗？", delegate: self, cancelButtonTitle: "确认").show()
        UIAlertView(title: "问你一个问题", message: "你是傻逼吗？", delegate: <#UIAlertViewDelegate?#>, cancelButtonTitle: <#String?#>, otherButtonTitles: <#String#>, <#moreButtonTitles: String#>...)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cities = ["fuyang","hefei","wuhan"]
        var myCity = "KYawn"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

