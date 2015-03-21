//
//  ViewController.swift
//  mySlider
//
//  Created by K.Yawn Xoan on 3/19/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider1: UISlider!
    @IBOutlet weak var image1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image1.image = UIImage(named: "0")
        mySlider1.setThumbImage(UIImage(named: "2x"), forState: UIControlState.Normal)
        mySlider1.setThumbImage(UIImage(named: "3x"), forState: UIControlState.Highlighted)
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        
        image1.alpha = CGFloat(sender.value)
        NSLog("the value is %f",sender.value)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

