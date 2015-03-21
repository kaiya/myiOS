//
//  ViewController.swift
//  myAlertViewDemo
//
//  Created by K.Yawn Xoan on 3/19/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlertViewBtnClick(sender: UIButton) {
        
        
        //        UIAlertView(title: "Hello", message: "Hello everyone", delegate: self, cancelButtonTitle: "OK").show()
        var alertView1 = UIAlertView(title: "hello", message: "hello everyone", delegate: self, cancelButtonTitle: "Login",otherButtonTitles:"Cancle")
        alertView1.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        alertView1.show()
        
    }
    
    //delegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        alertView.textFieldAtIndex(0)?.borderStyle = UITextBorderStyle.Line
        var username = alertView.textFieldAtIndex(0)?.text
        var password = alertView.textFieldAtIndex(1)?.text
        
        if(buttonIndex == 0){
            var req = NSMutableURLRequest(URL: NSURL(string: "http://www.azfs.com.cn/Login/ioscheck.php")!)
            req.HTTPMethod = "POST"
            req.HTTPBody = NSString(string: "username=\(username!)&&password=\(password!)").dataUsingEncoding(NSUTF8StringEncoding)
            
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue(), completionHandler: { (req, data:NSData!, error:NSError!) -> Void in
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        var result = NSString(data: data, encoding: NSUTF8StringEncoding)
                        UIAlertView(title: "Result", message: "\(result!)", delegate: nil, cancelButtonTitle: "OK").show()
                    })
                    
                    
                    
                })
                
                
                
                
            })
            
        }
        
        //        UIAlertView(title: "Hello", message: "Button \(buttonIndex) clicked", delegate: nil, cancelButtonTitle: "OK").show()
        
        //        UIAlertView(title: "Hello", message: "Button \(buttonIndex) clicked", delegate: self, cancelButtonTitle: "OK").show() // 代理为自己时会自己调用自己 重复执行此函数 无限循环显示下去
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

