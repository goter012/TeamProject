//
//  detailViewController.swift
//  TeamProject
//
//  Created by Gemma Velasco on 12/5/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit

class detailViewController: UIViewController{


    var dog: Dog!
    
    
    @IBOutlet weak var dogImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dogImage.image = UIImage(named:dog.dogPic!)
        nameLabel.text = dog.name
        ageLabel.text = dog.age
        sexLabel.text = dog.sex
        breedLabel.text = dog.breed
        sizeLabel.text = dog.size
        descriptionText.text = dog.dogDescription
        
        descriptionText.flashScrollIndicators()
    }
}
