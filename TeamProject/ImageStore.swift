//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

import UIKit
// Stores IMages
class ImageStore {
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
}

