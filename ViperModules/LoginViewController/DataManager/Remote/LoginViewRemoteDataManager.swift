//
//  LoginViewRemoteDataManager.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation
import Alamofire

class LoginViewRemoteDataManager: LoginViewRemoteDataManagerInputProtocol{
    weak var remoteRequestHandler: LoginViewRemoteDataManagerOutputProtocol?
    
    func postLoginRequest(loginModel: LoginRequestModel) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let data = self.fakeLogin(loginModel: loginModel)
            
            if let status = data.status,
                status{
                if let token = data.data?.token,
                    let user = data.data?.user{
                    self.remoteRequestHandler?.onSucessfulLogin(token: token, user: user)
                }
            }else{
                self.remoteRequestHandler?.onError(message: "Username and password do not match.")
            }
        }
        // Other error message need to be implemented, but later
//        Alamofire
//            .request(EndPoints.loginAPI.url, method: .post, parameters: loginModel.parameter)
//            .validate()
//            .responseLoginResponseModel { response in
//                switch response.result{
//                case .success(let loginResponseModel):
//                    if let status = loginResponseModel.status, status{
//                       if  let token = loginResponseModel.data?.token,
//                        let user = loginResponseModel.data?.user{
//                            self.remoteRequestHandler?.onSucessfulLogin(token: token, user: user)
//                       }else{
//                            self.remoteRequestHandler?.onError(message: "Could not fetch user information, please contact the support.")
//                        }
//                    }else{
//                        if let statusMessage = loginResponseModel.message{
//                            self.remoteRequestHandler?.onError(message: statusMessage)
//                        }else{
//                            self.remoteRequestHandler?.onError(message: "Something went wrong. Please try again later")
//                        }
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    self.remoteRequestHandler?.onError(message: error.localizedDescription)
//                }
//        }
    }
    
    private func fakeLogin(loginModel: LoginRequestModel) -> LoginResponseModel{
        if loginModel.username == "admin" && loginModel.password == "admin123"{
            return LoginResponseModel(status: true, message: "", code: 200, data: LoginResponseModelData(token: "token", user: UserData(id: 1, firstName: "FirstName", lastName: "LastName", email: "email@email.com", phone: "1234567890", gender: "Male")))
        }
        
        return LoginResponseModel(status: false, message: "", code: 404, data: nil)
    }
}
