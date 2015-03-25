//
//  ViewController.swift
//  myPhotoPicker
//
//  Created by K.Yawn Xoan on 3/24/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var photoImageView = UIImageView(frame: CGRectMake(40, 120, 150, 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoImageView.layer.masksToBounds = true
        self.photoImageView.layer.cornerRadius = self.photoImageView.bounds.size.width*0.5
//        self.photoImageView.layer.borderWidth = 5.0
//        self.photoImageView.layer.borderColor = UIColor.blackColor().CGColor
        
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
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

