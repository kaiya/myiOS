//
//  ViewController.swift
//  BeautifulLoginView
//
//  Created by K.Yawn Xoan on 3/18/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//1.点击 next 释放第一响应（失去焦点）给输入框绑定Did End On Exit 事件
//2.点击屏幕 首先给view绑定UIControl 类 然后给Control绑定 Touch Down（按下）事件 注意 是textfield 要释放第一响应 而不是sender
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var EmailFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    @IBAction func EmailFieldExit(sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    @IBAction func PasswordFieldExit(sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    @IBAction func controlExit(sender: AnyObject) {
        
        EmailFiled.resignFirstResponder()
        PasswordField.resignFirstResponder()
        
    }

    @IBAction func LoginBtnClick(sender: UIButton) {
        
        
        var req = NSMutableURLRequest(URL: NSURL(string: "http://www.azfs.com.cn/Login/ioscheck.php")!)
        req.HTTPMethod = "post"
        req.HTTPBody = NSString(string: "username=\(EmailFiled.text)&password=\(PasswordField.text)").dataUsingEncoding(NSUTF8StringEncoding)
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue()) { (req:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            if let d = data{
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    var result = NSString(data: data, encoding: NSUTF8StringEncoding)!
                    UIAlertView(title: "Notice", message: "\(result)", delegate: self, cancelButtonTitle: "OK").show()
                })
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

