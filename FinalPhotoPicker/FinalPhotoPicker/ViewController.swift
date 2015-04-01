//
//  ViewController.swift
//  FinalPhotoPicker
//
//  Created by K.Yawn Xoan on 3/25/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var photoImageView = UIImageView(frame: CGRectMake(40, 120, 150, 150))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoImageView.layer.masksToBounds = true
        self.photoImageView.layer.cornerRadius = self.photoImageView.bounds.size.width * 0.5
        self.view.addSubview(photoImageView)
    }
    
    @IBAction func photoPicker(sender: UIButton) {
        
        var myActionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancle", destructiveButtonTitle: nil, otherButtonTitles: "Choose photo from library", "take photos")
        myActionSheet.showInView(self.view)
    }
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        //        buttonIndex == 1 choose photo from library
        if (buttonIndex == 1){
            choosePhoto()
        }else if(buttonIndex == 2){
            takePhoto()
        }
    }
    func choosePhoto(){
        
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        photoPicker.allowsEditing = true
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    func takePhoto(){
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .Camera
        photoPicker.allowsEditing = true
        self.presentViewController(photoPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        photoImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

