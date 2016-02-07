//
//  ViewController2.swift
//  HelloWorld!
//
//  Created by Дмитрий Александров on 06.02.16.
//  Copyright © 2016 Дмитрий Александров. All rights reserved.
//

import UIKit
import LocalAuthentication
import PasscodeLock

class TouchIDController: UIViewController {
    
     @IBOutlet weak var passcodeSwitch: UISwitch!
    
    @IBAction func editButton(sender: UIButton) {
        
        let configuration = PasscodeLockConfiguration()
        
        let passcodeViewController = PasscodeLockViewController(state: .ChangePasscode, configuration: configuration)
        
        presentViewController(passcodeViewController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func passcodeSwitchValueChange(sender: UISwitch) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "passcodeSwitch")
        
        
        let configuration = PasscodeLockConfiguration()
        
        let passcodeVC: PasscodeLockViewController
        
        if passcodeSwitch.on {
            
            passcodeVC = PasscodeLockViewController(state: .SetPasscode, configuration: configuration)
            
            
            
            
            
        } else {
            
            
            
            passcodeVC = PasscodeLockViewController(state: .RemovePasscode, configuration: configuration)
            
            passcodeVC.successCallback = { lock in
                
                lock.repository.deletePasscode()
            }
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "passcodeSwitch")
        }
        
        presentViewController(passcodeVC, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        passcodeSwitch.setOn(NSUserDefaults.standardUserDefaults().boolForKey("passcodeSwitch"), animated: false)

}

}