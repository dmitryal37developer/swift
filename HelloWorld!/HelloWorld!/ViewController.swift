//
//  ViewController.swift
//  HelloWorld!
//
//  Created by Дмитрий Александров on 02.02.16.
//  Copyright © 2016 Дмитрий Александров. All rights reserved.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

