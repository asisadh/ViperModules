//
//  SignUpView+UITextFieldDelegate.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

extension SignUpView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        activeTextField?.resignFirstResponder()
        activeTextField = nil
        
        if textField == txtFullName{
            txtEmailAddress.becomeFirstResponder()
        }
        
        if textField == txtEmailAddress{
            txtPassword.becomeFirstResponder()
        }
        
        if textField == txtPassword{
            txtConfirmPassword.becomeFirstResponder()
        }
        
        if textField == txtConfirmPassword{
            txtConfirmPassword.resignFirstResponder()
            processSignUp()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        lastContentOffset = self.scrollView.contentOffset
        return true
    }
}
