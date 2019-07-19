//
//  LoginViewLocalDataManagerTests.swift
//  ViperModulesTests
//
//  Created by Asis on 7/19/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import XCTest
import CoreData
@testable import ViperModules

class LoginViewLocalDataManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         try! deleteAllRecords()
    }

    override func tearDown() {
        try! deleteAllRecords()
    }
    
    func test_retriveUserInfo_returnsNil_ifThereIsNoUserInDatabase(){
        XCTAssertEqual(try! LoginViewLocalDataManager.reteriveUser(), nil, "Should return nil when there is no user in database")
    }
    
    func test_saveUserInfo_returnsUser_ifSuccessfullySaved(){
        let localDataManager = LoginViewLocalDataManager()
        try! localDataManager.saveUser(token: "token", userData: UserData(id: 1, firstName: "FirstName", lastName: "LastName", email: "email@email.com", phone: "1234567890", gender: "Male"))
        
        let user = try! LoginViewLocalDataManager.reteriveUser()
        
        XCTAssertEqual(user?.id, 1, "User id is 1 from our saveUser Function")
        XCTAssertEqual(user?.firstName, "FirstName", "User firstName is FirstName from our saveUser Function")
        XCTAssertEqual(user?.lastName, "LastName", "User lastName is LastName from our saveUser Function")
        XCTAssertEqual(user?.email, "email@email.com", "User email is email@email.com from our saveUser Function")
        XCTAssertEqual(user?.phone, "1234567890", "User phone is 1234567890 from our saveUser Function")
        XCTAssertEqual(user?.gender, "Male", "User gender is Male from our saveUser Function")
    }
    
    private func deleteAllRecords() throws {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: User.self))
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do{
            try managedObjectContext.execute(deleteRequest)
        }catch{
            throw PersistenceError.objectNotFound
        }
    }
}
