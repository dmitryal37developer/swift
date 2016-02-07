//
//  ViewController.swift
//  HelloWorld!
//
//  Created by Дмитрий Александров on 02.02.16.
//  Copyright © 2016 Дмитрий Александров. All rights reserved.
//

import UIKit
import LocalAuthentication
import PasscodeLock


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var cameraControl: UIBarButtonItem!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var PhotoLibrary: UIBarButtonItem!
    
    
    func didTapView(){
        
        self.view.endEditing(true)
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer()
        
        tapRecognizer.addTarget(self, action: "didTapView")
        
        self.view.addGestureRecognizer(tapRecognizer)
        
      
        
    
        
        }
    
    @IBAction func PhotoLibraryOpen(sender: UIBarButtonItem) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func CameraStart(sender: UIBarButtonItem) {
        
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker
        .sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil)
    }
    
}



   






        
        
        
    
   
    
    






    
    





