//
//  LoginViewTests.swift
//  ViperModulesUITests
//
//  Created by Asis on 7/18/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import XCTest

class LoginViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func test_LoginWith_emptyUsernameCredential() {
        let app = XCUIApplication()
        let doneButton = app.toolbars.buttons["Done"]
        let elementsQuery = app.scrollViews.otherElements
        
        let usernameField = elementsQuery.textFields["Username"]
        usernameField.tap()
        usernameField.typeText("")
        doneButton.tap()
        
        let passwordField = elementsQuery.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("blabla")
        doneButton.tap()
        
        elementsQuery.buttons["Login"].tap()
       
        XCTAssert(app.alerts.element.staticTexts["Username cannot be empty."].exists)
    }
    
    func test_LoginWith_emptyPasswordCredential() {
        let app = XCUIApplication()
        let doneButton = app.toolbars.buttons["Done"]
        let elementsQuery = app.scrollViews.otherElements
        
        let usernameField = elementsQuery.textFields["Username"]
        usernameField.tap()
        usernameField.typeText("blabla")
        doneButton.tap()
        
        let passwordField = elementsQuery.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("")
        doneButton.tap()
        
        elementsQuery.buttons["Login"].tap()
        
        XCTAssert(app.alerts.element.staticTexts["Password cannot be empty."].exists)
    }
    
    
    func test_LoginWith_passwordLessThan6Characters() {
        let app = XCUIApplication()
        let doneButton = app.toolbars.buttons["Done"]
        let elementsQuery = app.scrollViews.otherElements
        
        let usernameField = elementsQuery.textFields["Username"]
        usernameField.tap()
        usernameField.typeText("blabla")
        doneButton.tap()
        
        let passwordField = elementsQuery.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("bale")
        doneButton.tap()
        
        elementsQuery.buttons["Login"].tap()
        
        XCTAssert(app.alerts.element.staticTexts["Password should be 6 characters long."].exists)
    }
    
    func test_LogiWith_invalidUsernameAndPasswordCredentials() {
        let app = XCUIApplication()
        let doneButton = app.toolbars.buttons["Done"]
        let elementsQuery = app.scrollViews.otherElements
        
        let usernameField = elementsQuery.textFields["Username"]
        usernameField.tap()
        usernameField.typeText("blabla")
        doneButton.tap()
        
        let passwordField = elementsQuery.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("blablabla")
        doneButton.tap()
        
        elementsQuery.buttons["Login"].tap()
        
        let alertText = app.alerts.element.staticTexts["Username and password do not match."]
        self.waitForElementToAppear(element: alertText)
    }

    private func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 10,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
        }
    }
}
