//
//  LoginView+LoginViewProtocol.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import UIKit

//MARK: LoginViewProtocol Methods
extension LoginView: LoginViewProtocol {
    func showError(message: String) {
        print(message)
        presenter?.showAlert(message: message)
    }
    
    func showLoading() {
//        #error("Show Loding View")
    }
    
    func hideLoading() {
//        #error("Hide Loading View")
    }
}
