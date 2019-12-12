//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

import Foundation
import UIKit
import CoreData
// This class creates User accounts
class createController: UIViewController {
    
    let persistenceManager = PersistenceManager.shared
    let model = tableModel.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       passwordField.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.becomeFirstResponder()
    }
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    //Creates New User
    @IBAction func createPressed(_ sender: UIButton) {
        if (isValidEmail(email: emailField.text!)){
            if(model.createUser(nameField.text!, emailField.text!, passwordField.text!, phoneNumField.text!)){
                print("USER CREATED")
            }else{
                let alert = UIAlertController(title: "Error", message: "Error while creating account", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Invalid email", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            }
        }
    
    

    // Checks for valid email format
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}



