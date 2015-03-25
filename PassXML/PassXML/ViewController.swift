//
//  ViewController.swift
//  PassXML
//
//  Created by K.Yawn Xoan on 3/23/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,NSXMLParserDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("data", ofType: "xml")!))
        parser?.delegate = self
        parser?.parse()
        
        
    }
    var currentNodeName:String!
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        currentNodeName = elementName
        //        println(elementName)
        
        if elementName == "person" {
            
            if let age: AnyObject = attributeDict["age"]{
                println("age:\(age)")
            }
        }
    }
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        //        println(string)
        //        var str = String.stringByTrimmingCharactersInSet()
        var str = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if str != ""{
            println("current node :\(currentNodeName),value:\(str)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}



}
