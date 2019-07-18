//
//  LoginRequestModel.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/28/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

struct LoginRequestModel{
    let username: String
    let password: String
}

extension LoginRequestModel{
    var parameter: [String : String] {
        return [ "username": self.username,
                 "password" : self.password
        ]
    }
}
