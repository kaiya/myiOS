//
//  ViewController.swift
//  Questions
//
//  Created by K.Yawn Xoan on 3/23/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSXMLParserDelegate{

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tfInputAnswer: UITextField!
    @IBOutlet weak var lAnswerD: UILabel!
    @IBOutlet weak var lAnswerC: UILabel!
    @IBOutlet weak var lAnswerB: UILabel!
    @IBOutlet weak var lAnswerA: UILabel!
    @IBOutlet weak var lQuestion: UILabel!
    
    
    var questions:Array<Question> = []
    var currentQuestion:Question
    var currentShowQuestion:Question
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("questions", ofType: "xml")!))
       parser?.delegate = self
        parser?.parse()
        
        
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        if elementName == "question"{
                currentQuestion = Question()
            questions.append(currentQuestion)
            currentQuestion.question = attributeDict["text"]! as String
            currentQuestion.right = attributeDict["right"]! as String
        } else if elementName == "answer"{
        
            var tag = attributeDict["tag"]! as String
            if tag == "A"{
            currentQuestion.answerA = attributeDict["text"]! as String
            
            }else if tag == "B"{
                currentQuestion.answerB = attributeDict["text"]! as String
                
            }else if tag == "C"{
                currentQuestion.answerC = attributeDict["text"]! as String
                
            }else if tag == "D"{
                currentQuestion.answerD = attributeDict["text"]! as String
                
            }
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser!) {
//        println("Size of array:\(questions.count)")
        var q = questions[0]
        lQuestion.text = currentShowQuestion.question
        lAnswerA.text = currentShowQuestion.answerA
        lAnswerB.text = currentShowQuestion.answerB
        lAnswerC.text = currentShowQuestion.answerC
        lAnswerD.text = currentShowQuestion.answerD
    }
    @IBAction func btnPressed(sender: UIButton) {
        if tfInputAnswer.text == currentShowQuestion.right{
            println("right")
        }else{
            println("wrong")
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

