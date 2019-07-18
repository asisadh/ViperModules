//
//  LoginResponseModel.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

struct LoginResponseModel: Codable {
    let status: Bool?
    let message: String?
    let code: Int?
    let data: LoginResponseModelData?
}

struct LoginResponseModelData: Codable {
    let token: String?
    let user: UserData?
}

struct UserData: Codable {
    let id: Int?
    let firstName, lastName, email, phone: String?
    let gender: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, phone, gender
    }
}

// Actual json response
//{
//    "status": true,
//    "message": "User logged in successfully.",
//    "code": 200,
//    "data": {
//        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsImlzcyI6Imh0dHA6Ly9jb21mb3J0bmVwYWwudmlldzkudXMvYXBpL2xvZ2luIiwiaWF0IjoxNTUzNzQ5MTQ3LCJleHAiOjE1NTYzNzcxNDcsIm5iZiI6MTU1Mzc0OTE0NywianRpIjoiMkJ6dzNZeVAxM0xFUWkwTCJ9.pgqVRaJ3ikAVkTwP82tES6jDNbzqmX5-4JlGjN452p8",
//        "user": {
//            "id": 2,
//            "first_name": "Aashish",
//            "last_name": "Adhikari",
//            "email": "asis.adh@gmail.com",
//            "phone": "98xxxxxxx",
//            "gender": "Male"
//        }
//    }
//}
