//
//  ViewController.swift
//  TeamProject
//
//  Created by guillermo j otero jr on 11/19/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, NSFetchedResultsControllerDelegate {

    let persistenceManager = PersistenceManager.shared
    
   
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    let context = persistenceManager.context
    let entityName = NSEntityDescription.entity(forEntityName: "User", in: context)!
       let user = NSManagedObject(entity: entityName, insertInto: context)
        user.setValue("goter012@fiu.edu", forKeyPath:"email")
        user.setValue("Guillermo", forKeyPath:"firstName")
        user.setValue("Otero", forKeyPath:"lastName")
        user.setValue("password", forKeyPath:"password")
        user.setValue("305-725-2360", forKeyPath:"phoneNumber")
        user.setValue("11-11-1997",forKeyPath:"dateOfBirth")
        do{
            try context.save()
            
        }catch let error as NSError{
            print(error)
        }
     
//        let context = persistenceManager.context
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
//
//
//        do{
//            let result = try context.fetch(fetchRequest)
//            for data in result as! [NSManagedObject]{
//                print(data.value(forKey: "email") as! String)
//            }
//
//        }catch{
//            print("Failed")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

