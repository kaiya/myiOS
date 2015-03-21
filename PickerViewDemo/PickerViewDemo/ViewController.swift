//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by K.Yawn Xoan on 3/20/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    var people = ["K.Yawn","Xoan","Jobs","Ive"]
    var age = ["29","30","22","40","38"]

    @IBOutlet weak var myPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        
    }

    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        
        return 2
        
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if(component == 0){
            
            return people.count

        }else {
            return age.count
        }
     
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if (component == 0){
        
            return people[row]
        }else {
            return age[row]
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            NSLog("\(people[row]) selected")
        }else{
            NSLog("\(age[row]) selected")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

