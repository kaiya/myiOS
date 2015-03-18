//
//  ViewController.swift
//  WeatherBeauty
//
//  Created by K.Yawn Xoan on 3/16/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherNum: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var image3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = "https://api.thinkpage.cn/v2/weather/now.json?city=beijing&language=zh-chs&unit=c&key=PLXYYE660V"
        var req = NSURLRequest(URL: NSURL(string: url)!)
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue()) { (_, data, e) -> Void in
            if  e == nil {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    
                    if let json:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:nil) {
                        var weatherInfo:AnyObject? = json?.objectForKey("weather")!
                        var firstArray:AnyObject? = (weatherInfo as NSArray).objectAtIndex(0)
                        var myCityName = firstArray?.objectForKey("city_name")! as NSString
                        var nowWeather: AnyObject? = (firstArray as NSDictionary).objectForKey("now")
                        var pictureCode = nowWeather?.objectForKey("code") as NSString
                        var temperature = nowWeather?.objectForKey("temperature") as NSString
                        
                        self.cityName.text = myCityName
                        self.image3.image = UIImage(named: "\(pictureCode)")
                        self.weatherNum.text = "\(temperature)°"
                        
                    }
                })
                
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

