//
//  SignUpView+SignUpProtocol.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

extension SignUpView: SignUpViewProtocol{
    
    func showError(message: String) {
        presenter?.showAlert(message: message)
    }
    
    func showLoading() {
//        #error("Show Loading View")
    }
    
    func hideLoading() {
//        #error("Hide Loading View")
    }
}
