//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

import Foundation
import UIKit
import MessageUI
// This class is the controller for the Contact us tab
class contactUsViewController: UIViewController,MFMailComposeViewControllerDelegate{
    // Calls Resqme
    @IBAction func callPressed(_ sender: Any) {
        
        guard let number = URL(string: "tell://" + "3059705970") else{return}
        UIApplication.shared.open(number)
        
    }
    
    @IBOutlet weak var emailButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        emailButton.titleLabel?.text = "resqmedogmission@aol.com"
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    // Emails Resqme
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
