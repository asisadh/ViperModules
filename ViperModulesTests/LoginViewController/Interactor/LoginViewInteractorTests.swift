//
//  LoginViewInteractorTests.swift
//  ViperModulesTests
//
//  Created by Asis on 7/18/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import XCTest
@testable import ViperModules

class LoginViewInteractorTests: XCTestCase {
    
    func test_loginWith_emptyUsernameCredential(){
        let interactor = LoginViewInteractor()
        
        let validateCredentials = interactor.validUserCredentials(username: "", password: "dsadas")
        XCTAssertFalse(validateCredentials.status)
        XCTAssertEqual(validateCredentials.message, "Username cannot be empty.")
    }
    
    func test_loginWith_emptyPasswordCredential(){
        let interactor = LoginViewInteractor()
        
        let validateCredentials = interactor.validUserCredentials(username: "dsasda", password: "")
        XCTAssertFalse(validateCredentials.status)
        XCTAssertEqual(validateCredentials.message, "Password cannot be empty.")
    }
    
    func test_loginWith_passwordLessThan6Characters(){
        let interactor = LoginViewInteractor()
        
        let validateCredentials = interactor.validUserCredentials(username: "sadeae", password: "asde")
        XCTAssertFalse(validateCredentials.status)
        XCTAssertEqual(validateCredentials.message, "Password should be 6 characters long.")
    }
}
