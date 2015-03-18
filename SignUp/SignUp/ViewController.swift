//
//  ViewController.swift
//  SignUp
//
//  Created by K.Yawn Xoan on 3/18/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myPasswordConfirm: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBAction func SubmitClick(sender: AnyObject) {
        
        var req = NSMutableURLRequest(URL: NSURL(string: "http://azfs.com.cn/Login/iossignup.php")!)
        req.HTTPMethod = "POST"
        req.HTTPBody = NSString(string: "username=\(username.text)&email=\(myEmail.text)&password=\(myPassword.text)&password-confirm=\(myPasswordConfirm.text)").dataUsingEncoding(NSUTF8StringEncoding)
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue()) { (req:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            if let d = data{
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    var result = NSString(data: data, encoding: NSUTF8StringEncoding)!
                    UIAlertView(title: "Notice", message: "\(result)", delegate: self, cancelButtonTitle: "OK").show()
                    
                })
                
            }
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

