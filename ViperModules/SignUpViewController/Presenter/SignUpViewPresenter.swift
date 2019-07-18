//
//  SignUpViewPresenter.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

class SignUpViewPresenter: SignUpViewPresenterProtocol{
    
    var view: SignUpViewProtocol?
    var interactor: SignUpViewInteractorInputProtocol?
    var wireframe: SignUpWireFrameProtocol?
    
    func viewDidLoad() {
        // currently no thing is needed to be done
    }
    
    func signUp(name: String, email: String, password: String, confirmPassword: String) {
        if password == confirmPassword{
            interactor?.postSignUpRequest(name: name, email: email, password: password)
        }else{
           showAlert(message: "Password do not match.")
        }
    }
    
    func signIn() {
        if let view = view{
            wireframe?.presentLoginScreen(from: view)
        }
    }
    
    func routeToHomeScreen() {
        if let view = view{
            wireframe?.presentHomeScreen(from: view)
        }
    }
    
    func showAlert(message: String) {
        if let view = view{
            wireframe?.alertScreen(from: view, message: message)
        }
    }
}

extension SignUpViewPresenter: SignUpViewInteratorOutputProtocol{
    func didSignUpCompleted() {
        view?.hideLoading()
        routeToHomeScreen()
    }
    
    func onError(message: String) {
        view?.hideLoading()
        showAlert(message: message)
    }
}
