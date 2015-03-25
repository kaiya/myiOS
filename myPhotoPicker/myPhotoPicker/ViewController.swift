//
//  ViewController.swift
//  myPhotoPicker
//
//  Created by K.Yawn Xoan on 3/24/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var photoImageView = UIImageView(frame: CGRectMake(40, 120, 200, 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(photoImageView)
    }

    @IBAction func photoPicker(sender: AnyObject) {
        
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        photoPicker.allowsEditing = true
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
//        NSLog(info[UIImagePickerControllerMediaURL])
        println(info[UIImagePickerControllerReferenceURL])
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

