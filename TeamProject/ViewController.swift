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
    
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passFIeld: UITextField!
    var email: String!
    
    var password:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let context = persistenceManager.context
        
        passFIeld.isSecureTextEntry = true
        
        //let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        print("Hello")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func logInPressed(_ sender: Any) {
        
        let context = persistenceManager.context
        
        do {
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "email == %@ && password == %@", emailField.text!, passFIeld.text!)
            let fetchedResults = try context.fetch(fetchRequest) as! [User]
            
            if (fetchedResults.count == 0){
                
                let alert = UIAlertController(title: "Error", message: "Invalid email or password", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                
            
            }
            
        }
        catch {
            print ("fetch task failed", error)
        }
        
    }
    
}

