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
    
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
   
    var email: String!
    var password: String!
    var imageStore: UIImage!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        emailField.text = email
        
    }
}
