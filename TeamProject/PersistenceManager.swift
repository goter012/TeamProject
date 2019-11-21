//
//  PersistenceManager.swift
//  TeamProject
//
//  Created by sacha kai neptune arthurs on 11/21/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import CoreData


final class PersistenceManager{
    
    private init() {}
    static let shared = PersistenceManager()
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TeamProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully ")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
