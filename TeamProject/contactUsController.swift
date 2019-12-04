//
//  contactUsController.swift
//  TeamProject
//
//  Created by Gemma Velasco on 11/22/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class contactUsViewController: UIViewController,MFMailComposeViewControllerDelegate{
    
    @IBAction func callPressed(_ sender: Any) {
        
        guard let number = URL(string: "tell://" + "3059705970") else{return}
        UIApplication.shared.open(number)
        
    }
    
    @IBOutlet weak var emailButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        emailButton.titleLabel?.text = "resqmedogmission@aol.com"
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func emailPressed(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["resqmedogmission@aol.com"])
            mail.setSubject("Resqme Dog Adoption!")
            //mail.setMessageBody("I would like more information about dog: " + instance2.eName, isHTML: false)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
        
    }
}
