//
//  LoginViewController.swift
//  WeiXin
//
//  Created by K.Yawn Xoan on 3/31/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var serverTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as UIBarButtonItem == self.doneButton {
            NSUserDefaults.standardUserDefaults().setObject(userTF.text, forKey: "weixinID")
            NSUserDefaults.standardUserDefaults().setObject(pwdTF.text, forKey: "weixinPwd")
            NSUserDefaults.standardUserDefaults().setObject(serverTF.text, forKey: "wxserver")
            
        }
        
    }
    

}
