//
//  SignUpViewLocalDataManager.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/28/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation
import CoreData

class SignUpViewLocalDataManager: SignUpLocalDataManagerInputProtocol{
    func saveUser(token: String, userData: UserData) throws {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newUser = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext){
            let user = User(entity: newUser, insertInto: managedObjectContext)
            user.id = Int32(userData.id ?? 0)
            user.firstName = userData.firstName
            user.lastName = userData.lastName
            user.email = userData.email
            user.phone = userData.phone
            user.gender = userData.gender
            user.token = token
            
            do {
                try managedObjectContext.save()
            } catch{
                throw PersistenceError.couldNotSaveObject
            }
        }
    }
}
