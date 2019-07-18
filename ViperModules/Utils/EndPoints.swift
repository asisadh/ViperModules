//
//  EndPoints.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

struct API{
    static let base_url = "http://banquetsquad.com/"
}

protocol EndPoint{
    var path: String { get }
    var url: String { get }
}

enum EndPoints{
    
    case homeAPI
    case productListingAPI(String)
    
    case loginAPI
    case signupAPI
    case forgetPasswordAPI
    
}

extension EndPoints: EndPoint{
    var path: String {
        switch self{
        case .homeAPI:                                              return "/api/home"
        case .productListingAPI(let data):              return "/api/product/" + data
        case .loginAPI:                                                return "/api/login"
        case .signupAPI:                                             return "/api/signUp"
        case .forgetPasswordAPI:                             return "/api/forgetPassword"
        }
    }
    
    var url: String {
        return "\(API.base_url)\(path)"
    }
}
