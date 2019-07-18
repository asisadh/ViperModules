//
//  SignUpView+UIGesture.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

extension SignUpView{
    func setUpTapGestures(){
        let signInTapGesture = UITapGestureRecognizer(target: self, action: #selector(signInTapped))
        lblAlreadyHaveAccount.isUserInteractionEnabled = true
        lblAlreadyHaveAccount.addGestureRecognizer(signInTapGesture)
    }
    
    @objc func signInTapped(recognizer: UITapGestureRecognizer) {
        presenter?.signIn()
    }
}
