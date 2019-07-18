//
//  SignUpInteractor.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

class SignUpViewInteractor: SignUpViewInteractorInputProtocol{
    
    var presenter: SignUpViewInteratorOutputProtocol?
    var remoteDataManager: SignUpRemoteDataManagerInputProtocol?
    var localDataManager: SignUpLocalDataManagerInputProtocol?
    
    func postSignUpRequest(name: String, email: String, password: String) {
        let signUpRequestModel = SignUpRequestModel(fullName: name, email: email, password: password)
        remoteDataManager?.postSignUpRequest(signupModel: signUpRequestModel)
    }
}

extension SignUpViewInteractor: SignUpRemoteDataManagerOutputProtocol{
    func onSucessfulSignUp(token: String, user: UserData) {
        
        // save the user info
        do{
            try localDataManager?.saveUser(token: token, userData: user)
            presenter?.didSignUpCompleted()
        }catch(let data){
            print("Error: \(data)")
            presenter?.onError(message: "Something went wrong. Please try again.")
        }
    }
    
    func onError(message: String) {
        presenter?.onError(message: message)
    }
}
