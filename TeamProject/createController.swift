//
//  createController.swift
//  TeamProject
//
//  Created by sacha kai neptune arthurs on 11/21/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class createController: UIViewController {
    
    let persistenceManager = PersistenceManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       pwField.isSecureTextEntry = true
    }
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    @IBAction func createPressed(_ sender: UIButton) {
        if (isValidEmail(email: emailField.text!)){
        let context = persistenceManager.context
        let entityName = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let user = NSManagedObject(entity: entityName, insertInto: context)
        user.setValue(emailField.text, forKeyPath:"email")
        user.setValue(pwField.text,forKeyPath:"password")
        do{
            try context.save()
            print("Saved successfully")
            
        }catch let error as NSError{
            print(error)
        }
    
        }else{
            let alert = UIAlertController(title: "Error", message: "Invalid email", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            }
        }
        
    

    
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


