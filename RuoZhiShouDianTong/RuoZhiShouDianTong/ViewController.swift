//
//  ViewController.swift
//  RuoZhiShouDianTong
//
//  Created by K.Yawn Xoan on 3/19/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aIV1: UIActivityIndicatorView!
    @IBOutlet weak var mySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blackColor()
    }

    @IBAction func SwitchValueChanged(sender: UISwitch) {
        if (mySwitch.on){
            aIV1.startAnimating()
           
            
        }else{
            aIV1.stopAnimating()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

