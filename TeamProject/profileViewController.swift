//
//  profileViewController.swift
//  TeamProject
//
//  Created by Gemma Velasco on 11/22/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class profileViewController: UIViewController{
    
    
    let model = tableModel.sharedInstance
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
   
    var email: String!
    var password: String!
    
    
    let dateFormatter = DateFormatter()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "d-MMM-YYYY"
       
       let user = model.fetchUser()
       
        userPicture.image = UIImage(named:user.picture!)
        nameField.text = user.name!
        emailField.text = user.email!
        phoneField.text = user.phoneNumber!
        birthdatePicker.date = dateFormatter.date(from:user.dateOfBirth!)!
        
       
    }
    
    
}
