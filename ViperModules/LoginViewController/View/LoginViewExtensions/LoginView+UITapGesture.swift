//
//  LoginView+UITapGesture.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

extension LoginView{
    func setUpTapGestures(){
        let forgetPasswordTapGesture = UITapGestureRecognizer(target: self, action: #selector(forgetPasswordTapped))
        lblForgetPassword.isUserInteractionEnabled = true
        lblForgetPassword.addGestureRecognizer(forgetPasswordTapGesture)
        
        let signUpTapGesture = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        lblDontHaveAnAccount.isUserInteractionEnabled = true
        lblDontHaveAnAccount.addGestureRecognizer(signUpTapGesture)
    }
    
    @objc func forgetPasswordTapped(recognizer: UITapGestureRecognizer) {
        presenter?.forgetPassword()
    }
    
    @objc func signUpTapped(recognizer: UITapGestureRecognizer) {
        presenter?.signup()
    }
}
