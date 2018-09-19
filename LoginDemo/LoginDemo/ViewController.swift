//
//  ViewController.swift
//  LoginDemo
//
//  Created by Kaiya on 9/19/18.
//  Copyright © 2018 Jinan University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PhoneNum: UITextField!
    @IBOutlet weak var passwd: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func loginBtnClicked(_ sender: Any) {
//        var req = NSMutableURLRequest(url: URL(string: "http://www.azfs.com.cn/Login/ioscheck.php")!)
//        req.httpMethod = "POST"
//        req.httpBody = NSString(string: "username=\(String(describing: PhoneNum.text))&password=\(String(describing: passwd.text))").data(using: String.Encoding.utf8.rawValue, allowLossyConversion: true)
//        NSURLConnection.sendAsynchronousRequest(req as URLRequest, queue: OperationQueue()) { (resq:URLResponse!, data:Data!, error:Error!) -> Void in
//
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                if let d = data {
//                    var result = NSString(data: d, encoding: NSUTF8StringEncoding)
//                    if (result == "success"){
//                        UIAlertView(title: "Success!", message: "Login Successed!", delegate: self, cancelButtonTitle: "Close").show()
//                    }else{
//                        UIAlertView(title: "Failed!", message: "Login Failed!", delegate: self, cancelButtonTitle: "Close").show()
//                    }
//                }
//            })
//        }
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters = ["username": PhoneNum.text, "password": passwd.text]
        
        //create the url with URL
        let url = URL(string: "http://www.azfs.com.cn/Login/ioscheck.php")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    let tmpData = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
                    let result = String(data: tmpData, encoding: String.Encoding.utf8)
                    if(result == "success"){
                        UIAlertView(title: "Success!", message: "Login Successed!", delegate: self, cancelButtonTitle: "Close").show()
                    }else{
                        
                    }
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
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

