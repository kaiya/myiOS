//
//  ViewController.swift
//  actionSheetDemo
//
//  Created by K.Yawn Xoan on 3/19/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheetclick(sender: UIButton) {
        
        var actionSheet = UIActionSheet(title: "ActinoSheet", delegate: self, cancelButtonTitle: "Cancle", destructiveButtonTitle: "delete")
        
        actionSheet.showInView(self.view)
        
    }
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        UIAlertView(title: "Clicked", message: "you clicked \(buttonIndex)", delegate: nil, cancelButtonTitle: "OK").show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

