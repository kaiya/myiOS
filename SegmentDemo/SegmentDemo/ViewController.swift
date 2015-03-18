//
//  ViewController.swift
//  SegmentDemo
//
//  Created by K.Yawn Xoan on 3/18/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addSegmentName: UITextField!
    @IBOutlet weak var segmentControl1: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addSegment(sender: UIButton) {
        
        segmentControl1.insertSegmentWithTitle(addSegmentName.text, atIndex: segmentControl1.numberOfSegments, animated: true)
        
        
    }
    @IBAction func removeSegment(sender: UIButton) {
        
        segmentControl1.removeSegmentAtIndex(segmentControl1.numberOfSegments, animated: true)
        
    }
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            self.view.backgroundColor = UIColor.blackColor()
        case 1:
            self.view.backgroundColor = UIColor.whiteColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.yellowColor()
        default:
            println("error")
            
        }
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

