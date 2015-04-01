//
//  ViewController.swift
//  Login
//
//  Created by K.Yawn Xoan on 3/15/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBAction func loginBtnClicked(sender: UIButton) {
        
        var req = NSMutableURLRequest(URL: NSURL(string: "http://www.azfs.com.cn/Login/ioscheck.php")!)
        req.HTTPMethod = "POST"
        req.HTTPBody = NSString(string: "username=\(phoneNum.text)&password=\(password.text)").dataUsingEncoding(NSUTF8StringEncoding)
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue()) { (resq:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if let d = data {
                    var result = NSString(data: d, encoding: NSUTF8StringEncoding)
                    if (result == "success"){
                        UIAlertView(title: "Success!", message: "Login Successed!", delegate: self, cancelButtonTitle: "Close").show()
                    }else{
                        UIAlertView(title: "Failed!", message: "Login Failed!", delegate: self, cancelButtonTitle: "Close").show()
                    }
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

