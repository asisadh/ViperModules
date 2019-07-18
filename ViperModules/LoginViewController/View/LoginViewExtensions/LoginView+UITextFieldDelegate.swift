//
//  LoginView+UITextFieldDelegate.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

extension LoginView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsernameValue{
            txtPasswordValue.becomeFirstResponder()
        }
        
        if textField == txtPasswordValue{
            txtPasswordValue.resignFirstResponder()
            processLogin()
        }
        return true
    }
}
