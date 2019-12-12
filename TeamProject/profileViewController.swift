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

class profileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var imagePicker: UIImagePickerController!
    let model = tableModel.sharedInstance
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
   
    @IBOutlet weak var deleteLabel: UIButton!
    var email: String!
    var password: String!
    var imageStore: ImageStore!
    var key :String!
    let dateFormatter = DateFormatter()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        
        
        deleteLabel.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "d-MMM-YYYY"
       
       let user = model.fetchUser()
       
        userPicture.image = UIImage(named:user.picture!)
        nameField.text = user.name!
        emailField.text = user.email!
        phoneField.text = user.phoneNumber!
        birthdatePicker.date = dateFormatter.date(from:user.dateOfBirth!)!
        birthdatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        birthdatePicker.setValue(false,forKey:"highlightsToday")
        
        
   
        
//       key = user.image
    }
    
    @IBAction func deleteUser(_ sender: Any) {
        model.deleteUser()
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width:size.width * heightRatio, height:size.height * heightRatio)
        } else {
            newSize = CGSize(width:size.width * widthRatio,  height:size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x:0, y:0, width:newSize.width, height:newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        //Save changes
       
            
        
            model.updateUser(name: nameField.text!, email: emailField.text!, phone: phoneField.text!, dateOfBirth: dateFormatter.string(from: birthdatePicker.date))
        
        
        
        
    }
    
    
    @IBAction func takePicture(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self as! UIImagePickerControllerDelegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        
        
        
        present(imagePicker,animated:true,completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageStore.setImage(image, forKey:UUID().uuidString )
        userPicture.image = image
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
