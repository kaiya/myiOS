//
//  ViewController.swift
//  ProgressViewDemo
//
//  Created by K.Yawn Xoan on 3/19/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView1: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView1.progress = 0
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "progressChange:", userInfo: nil, repeats: true)
//selector 中 的方法名当方法有参数时一定不要忘记加冒号:
        
    }
    
    func progressChange(sender:NSTimer){
        progressView1.progress += 0.1
    
        if(progressView1.progress >= 1){
//            sender.invalidate() //使sender这个计时器失效  所以只循环显示一次
            progressView1.progress = 0 //当值大于1时 归零 所以无限循环显示下去
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

