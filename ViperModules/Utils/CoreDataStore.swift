//
//  CoreDataStore.swift
//  Login-VIPER
//
//  Created by Aashish Adhikari on 3/3/19.
//  Copyright © 2019 Aashish Adhikari. All rights reserved.
//

import CoreData
import UIKit

class CoreDataStore{
    
    static var persistentStoreCoordinator: NSPersistentStoreCoordinator?{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.persistentStoreCoordinator
        }
        return nil
    }
    
    static var managedObjectModel: NSManagedObjectModel?{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.managedObjectModel
        }
        return nil
    }
    
    static var managedObjectContext: NSManagedObjectContext?{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }
}
