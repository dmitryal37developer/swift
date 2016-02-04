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


class ViewController: UIViewController {
    
    
    @IBOutlet weak var passcodeSwitch: UISwitch!
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textAge: UITextField!
    @IBOutlet weak var textStreet: UITextField!
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelStreet: UILabel!
    
    
    @IBAction func buttonHello(sender: UIButton) {
        
   
        
        
        
        if textName.text == "" {
            labelName.text = ""
        } else {
            labelName.text = "Привет, " + (textName.text)! + " !"
            
            
}
        
        if textAge.text == "" {
            labelAge.text = ""
        } else {
            labelAge.text = "Вам " + (textAge.text)! + " лет"
}
    
        
        
        if textStreet.text == "" {
            labelStreet.text = ""
        } else {
            labelStreet.text = "Вы живете в городе " + (textStreet.text)!
    }
        
}

    
    
    
    @IBAction func buttonCancel(sender: UIButton) {
        
        textName.text = ""
        textAge.text = ""
        textStreet.text = ""
        labelName.text = ""
        labelAge.text = ""
        labelStreet.text = ""
    }
    
        
    @IBAction func editButton(sender: UIButton) {
        
        let configuration = PasscodeLockConfiguration()
        
        let passcodeViewController = PasscodeLockViewController(state: .ChangePasscode, configuration: configuration)
        
        presentViewController(passcodeViewController, animated: true, completion: nil)
    }
   
    
    @IBAction func passcodeSwitchValueChange(sender: UISwitch) {
        
        let configuration = PasscodeLockConfiguration()
        
        let passcodeVC: PasscodeLockViewController
        
        if passcodeSwitch.on {
            
            passcodeVC = PasscodeLockViewController(state: .SetPasscode, configuration: configuration)
            
        } else {
            
           
            passcodeVC = PasscodeLockViewController(state: .RemovePasscode, configuration: configuration)
            
            passcodeVC.successCallback = { lock in
                
                lock.repository.deletePasscode()
                
                
            }
        }
        
        presentViewController(passcodeVC, animated: true, completion: nil)
    }

    
    
    
    func didTapView(){
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer()
        
        tapRecognizer.addTarget(self, action: "didTapView")
        
        self.view.addGestureRecognizer(tapRecognizer)
        
        }
    
}



   






        
        
        
    
   
    
    






    
    





