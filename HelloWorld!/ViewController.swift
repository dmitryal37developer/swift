//
//  ViewController.swift
//  HelloWorld!
//
//  Created by Дмитрий Александров on 02.02.16.
//  Copyright © 2016 Дмитрий Александров. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    
    
    
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

    // Функция скрытия клавиатуры (tap)
    func didTapView(){
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Метод для скрытия клавиатуры (tap)
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
        
        // Auth
        self.authenticateUser()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    func authenticateUser()
    {
        let contex = LAContext()
        var error: NSError?
        let reasonString = "Введите пароль"
        
        if contex.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            contex.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: {
                (success, policyError) -> Void in
                
                if success
                {
                    print("AuthenticationSuccessful")
                } else {
                   
                    
                    switch policyError!.code {
                    case LAError.SystemCancel.rawValue:
                        print("Authentication cancel by the system")
                    case LAError.UserCancel.rawValue:
                        print("Authentication cancel by the user")
                    case LAError.UserFallback.rawValue:
                        print("User selected to enter password")
                        NSOperationQueue.mainQueue().addOperationWithBlock( { () -> Void in
                            self.showPasswordAlert()
                        })
                        
                    default:
                        print("Authentication failed")
                        NSOperationQueue.mainQueue().addOperationWithBlock( { () -> Void in
                            self.showPasswordAlert()
                        })
                    }
                    
                }
                
            })
            
        } else {
            print(error?.localizedDescription)
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.showPasswordAlert()
        })
    }
        
    }
    
    
    
    
    func showPasswordAlert()
    {
        let alertController = UIAlertController(title: "Touch ID", message: "Введите ваш пароль", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Cancel)  { (action) -> Void in
            if let textField = alertController.textFields?.first as UITextField?
            {
                if textField.text == "test"
                {
                    print("Successfil")
                } else {
                    self.showPasswordAlert()
                }
            }
    }
    
        alertController.addAction(defaultAction)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Пароль"
            textField.textAlignment = NSTextAlignment.Center
            textField.secureTextEntry = true
          //  textField.keyboardType = UIKeyboardType.NumberPad
            
        
        }
        
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
}





