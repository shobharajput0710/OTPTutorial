//
//  ViewController.swift
//  OTPTutorial
//
//  Created by KartRocket iOSOne on 13/09/19.
//  Copyright © 2019 CodesRoom. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var txtOTP1: UITextField!
    
    @IBOutlet weak var txtOTP2: UITextField!
    
    @IBOutlet weak var txtOTP3: UITextField!
    
    @IBOutlet weak var txtOTP4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtOTP1.backgroundColor = UIColor.clear
        txtOTP2.backgroundColor = UIColor.clear
        txtOTP3.backgroundColor = UIColor.clear
        txtOTP4.backgroundColor = UIColor.clear

        addBottomBorderTo(textfield: txtOTP1)
        addBottomBorderTo(textfield: txtOTP2)
        addBottomBorderTo(textfield: txtOTP3)
        addBottomBorderTo(textfield: txtOTP4)

        
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        
        txtOTP1.becomeFirstResponder()

        }
 
    func addBottomBorderTo(textfield: UITextField){
        let layer = CALayer()
        layer.backgroundColor = UIColor.gray.cgColor
        layer.frame = CGRect(x: 0.0, y: textfield.frame.size.height - 2.0, width: textfield.frame.size.width, height: 2.0)
        textfield.layer.addSublayer(layer)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField.text!.count<1) && (string.count>0){
            if textField == txtOTP1{
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP2{
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP3{
                txtOTP4.becomeFirstResponder()
            }
            if textField == txtOTP4{
                txtOTP4.becomeFirstResponder()
            }
          textField.text = string
            return false
        }else if (textField.text!.count >= 1) && (string.count == 0) {
            if textField == txtOTP2{
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3{
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4{
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP1{
                txtOTP1.resignFirstResponder()
            }
            
            textField.text = ""
            return false
        }else if (textField.text?.count)! >= 1{
            textField.text = string
            return false
        }
        return true
    }

}

