//
//  ViewController.swift
//  myPickerViewDemo
//
//  Created by K.Yawn Xoan on 3/20/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    //数据源
    var provience = ["安徽","云南","广东","四川"]
    var city = ["安徽":["阜阳","芜湖","合肥","安庆"],"云南":["丽江","昆明","普洱","曲靖"],"广东":["广州","珠海","汕头","佛山"],"四川":["成都","绵阳","广元","宜宾"]]
    var selectedValue = "安徽"
    @IBOutlet weak var myPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }
    //列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    //行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return provience.count
        }else{
            if(city[selectedValue] != nil){
                return city[selectedValue]!.count
            }else{
                return 0
            }
            
        }
    }
    //显示title
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(component == 0){
            return provience[row]
        }else{
            if(city[selectedValue] != nil){
                return city[selectedValue]![row]
            }else{
                return "?"
            }
            
        }
    }
    //选中
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            selectedValue = provience[row]
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

