//
//  PersistenceError.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/28/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import Foundation

enum PersistenceError: Error{
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
