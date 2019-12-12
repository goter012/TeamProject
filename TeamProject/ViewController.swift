//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

import UIKit
import CoreData


// This class is the controller for the Log In
class ViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    let persistenceManager = PersistenceManager.shared
    let model = tableModel.sharedInstance
    
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        emailField.becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Logs User in to account.
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
            
            model.recordCurrentUser(emailField.text!, passFIeld.text!)
            
        }
        catch {
            print ("fetch task failed", error)
        }
        
    }
    
}

