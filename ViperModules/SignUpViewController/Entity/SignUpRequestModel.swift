//
//  SignUpRequestModel.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/28/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

struct SignUpRequestModel{
    let fullName: String
    let email: String
    let password: String
}

extension SignUpRequestModel{
    var parameter: [String : String]{
        return [ "fullName" : self.fullName,
                 "email" : self.email,
                 "password": self.password
        ]
    }
}
