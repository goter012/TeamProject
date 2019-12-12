//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

import Foundation
import UIKit
// Detail view for the dogs
class detailViewController: UIViewController{


    var dog: Dog!
    let model = tableModel.sharedInstance
    
    @IBOutlet weak var dogImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dog = model.selectedDog
        dogImage.image = UIImage(named:dog.dogPic!)
        nameLabel.text = dog.name
        ageLabel.text = dog.age
        sexLabel.text = dog.sex
        breedLabel.text = dog.breed
        sizeLabel.text = dog.size
        descriptionText.text = dog.dogDescription
        dogImage.layer.cornerRadius = 50
        descriptionText.isEditable = false
        descriptionText.flashScrollIndicators()
    }
}
