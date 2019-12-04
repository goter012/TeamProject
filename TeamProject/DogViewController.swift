//
//  TableView.swift
//  TeamProject
//
//  Created by Gemma Velasco on 11/20/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DogViewController: UICollectionViewController{
    let persistenceManager = PersistenceManager.shared
    
    let breeds = ["Terrier Mix","Lab Mix","Beagle Mix","Yorkie","Beagle Mix"]
    let dogNames = ["Luci","Hope","Tito","Lupita","Cheeto"]
    let ages = ["9 months", "2 Years", "8 Years","1 Year","4 Years"]
    let descriptions = ["Luci was found by a couple in Miami Beach. She was roaming the streets without a collar or tag. They were able to offer her a temporary home for a while. The couple wasn't able to find her a permanent home and was moving out of state and wouldn't be able to take her with them. They faced a tough decision and almost had to resort to taking Luci to the local shelter. Luci was welcomed into ResQMe and is now available for adoption. She is sweet, crate trained, and house broken. She loves cuddles and her squeeky toys and will make a great addition to any family! ","Hope is an example of complete abandonement. She was found in a nursery in Redland, Fl. Hope gave birth to 5 puppies there. She had to protect them against everything including the weather. So much so that 2 of her puppies had gone missing when she was brought in to ResQMe. After searching and finally locating all puppies, this little family was safe. All of Hope's puppies have since then been adopted but Hope remains at the rescue. She is a lovebug and the perfect companion to realx and watch TV with. She also loves to play outside with her favorite ball! ","Tito had a mom who adored him but unfortunatley, she passed away. Her son allowed Tito to stay with him temporarily but he wasn't really wanted. Tito would have ended up in the local shelter if we would not have rescued him. Tito has lived through such a traumatic situtaion that no sweet pup should have to endure. Tito is such a grateful little dog who is ready to give so much love! ","Lupita was an owner surrender. She was surrendered to us because her owner had recently gotten married and said he no longer had time for a dog. Lupita spent 12-14 daytime hours in a crate and was not even taken out for potty breaks resulting in her going potty in her own crate. Luckily, Lupita is safe, comfortable, and looking for a real loving family. She is energetic, loves other dogs, and enjoys playing. She is a perfect companion! ","Cheeto was found running a on the side of a very busy street. He had a collor that was tied to a broken chain. He was extremely skinny and malnourished with his ribs and bones showing. Because of the condition he was in, it is assumed Cheeto had run away from his owner who had him tied up and clearly underfed. After a few weeks of healthy, nutritious meals, Cheeto finally gained a healthy amount of weight. Cheeto has been with us the longest and continues to search for his forever family. Cheeto is playful, loves car rides and his toys. Cheeto is house broken and knows how to sit on command. He is an all around good boy! "]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = persistenceManager.context
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Dog")
        do{
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey:"name"))
            }
        }catch{
            print("Failed")
        }
        
    }
    
    
}
