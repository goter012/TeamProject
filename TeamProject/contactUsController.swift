//
//  contactUsController.swift
//  TeamProject
//
//  Created by Gemma Velasco on 11/22/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit

class contactUsViewController: UIViewController{
    
    @IBAction func callPressed(_ sender: Any) {
        
        guard let number = URL(string: "tell://" + "3059705970") else{return}
        UIApplication.shared.open(number)
        
    }
    
}
