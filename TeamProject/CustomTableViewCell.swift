//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    @IBOutlet weak var dogPic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
