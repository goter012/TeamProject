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
    
    let breeds = ["Terrier Mix","Lab Mix","Beagle Mix","Yorkie","Beagle Mix", "Chiweenie", "Chihuahua", "Shepard Mix", "Sharpei/American Bulldog Mix", "Pointer Mix", "German Shepard"]
    let dogNames = ["Luci","Hope","Tito","Lupita","Cheeto", "Felipe", "Snickers & Bon Bon", "Cookie", "Star", "Rocco", "Luna", "Rocky", "Iris"]
    let ages = ["9 Months", "2 Years", "8 Years","1 Year","4 Years", "1 Year", "11/8 Years", "8 Years", "3 Years", "3 Years", "2 Years", "1 Year", "4 Months"]
    let descriptions = ["Luci was found by a couple in Miami Beach. She was roaming the streets without a collar or tag. They were able to offer her a temporary home for a while. The couple wasn't able to find her a permanent home and was moving out of state and wouldn't be able to take her with them. They faced a tough decision and almost had to resort to taking Luci to the local shelter. Luci was welcomed into ResQMe and is now available for adoption. She is sweet, crate trained, and house broken. She loves cuddles and her squeeky toys and will make a great addition to any family! ","Hope is an example of complete abandonement. She was found in a nursery in Redland, Fl. Hope gave birth to 5 puppies there. She had to protect them against everything including the weather. So much so that 2 of her puppies had gone missing when she was brought in to ResQMe. After searching and finally locating all puppies, this little family was safe. All of Hope's puppies have since then been adopted but Hope remains at the rescue. She is a lovebug and the perfect companion to realx and watch TV with. She also loves to play outside with her favorite ball! ","Tito had a mom who adored him but unfortunatley, she passed away. Her son allowed Tito to stay with him temporarily but he wasn't really wanted. Tito would have ended up in the local shelter if we would not have rescued him. Tito has lived through such a traumatic situtaion that no sweet pup should have to endure. Tito is such a grateful little dog who is ready to give so much love! ","Lupita was an owner surrender. She was surrendered to us because her owner had recently gotten married and said he no longer had time for a dog. Lupita spent 12-14 daytime hours in a crate and was not even taken out for potty breaks resulting in her going potty in her own crate. Luckily, Lupita is safe, comfortable, and looking for a real loving family. She is energetic, loves other dogs, and enjoys playing. She is a perfect companion! ","Cheeto was found running a on the side of a very busy street. He had a collor that was tied to a broken chain. He was extremely skinny and malnourished with his ribs and bones showing. Because of the condition he was in, it is assumed Cheeto had run away from his owner who had him tied up and clearly underfed. After a few weeks of healthy, nutritious meals, Cheeto finally gained a healthy amount of weight. Cheeto has been with us the longest and continues to search for his forever family. Cheeto is playful, loves car rides and his toys. Cheeto is house broken and knows how to sit on command. He is an all around good boy! ", "Felipe has had a rough start. He was welcomed into a family when he was just a puppy. As he got older, his family chose to get rid of him becasue they felt the house smelled too much like 'dog'. Felipe was taken to a farm where he did not belong to anyone and was kept outisde in a chicken crate. His new owner also did not want a dog and was planning on taking Felipe on a car ride and dumping him on the side of the road. We at ResQMe are shocked with Felipe's story because he is such a great dog! He behaves well, is friendly, has A TON of character and is extremely loving. Felipe is searching for a home and family that has as much love for him as he has to offer.", "Snickers and Bon Bon are a very bonded pair. They were rescued from death row from the local shelter. Their owner had to surrender them when they were admitted into hospice and could no longer care for them. They are a great pair of pups that make loving companions. They are searching for a home that would accept them both as they love to do everything together, including snuggling up in the same bed!", "Cookie was part of a rescued group of chihuahuas rescued from death row from the local shelter. Cookie's owner had to surrender her and her 3 siblings when they were admitted into hospice and could no longer care for them. Cookie has had serious ear infections that led to hematomas. She was never treated for them from her previous owner so her ears have wrinkled in but she is still absolutely beautiful! Cookie is the sweetest little dog. She makes the perfect cuddle bug and is very playful. She loves her squeeky toys!", "Star was found rolling off on the road after falling off the back of a truck. Her what should have been loving owner, let her roll off the bed of the truck and continued driving off without even looking back. Star had scratches on her legs but thankfully was not seriously injured after this massive fall. Since then, Star has been at ResQMe. She is active, loves playing, going on walks and cuddling on the couch. She is house broken and an overall good, sweet girl. She has plenty of love to give to a deserving family.", "Rocco is our gentle giant. He was found emaciated and with no fur in a nursery in Redlands, FL. Rocco had a very serious skin condition that was so severe, we had no idea what color his fur was. After months and months of treatment, Rocco's skin was finally healed. Rocco has been availbale for adoption for almost 2 years. He knows how to sit and shake paws with anyone who meets him. Like many larger dogs, Rocco believes he is a lap dog and absolutely loves attention. He has an enormous, grateful heart with larger than life love to give.", "Luna was found skinny, hungry, and bleeding on the side of the road. She was rushed to the vet where she was taken care of. She is the perfect example of what happens with dog abandonement in the streets of South Florida. Luna is a sweetheart! She is very well behaved and house broken. She gets along well with other dogs, adults, and kids alike.", "Rocky comes from very irresponsible owners. They surrendered Rocky claiming they had no time for him. He was taken to the vet where we found he was mostly healthy but had not lost many of his baby teeth resulting in multiple teeth. Rocky will soon have his extra baby teeth surgically removed, as per the vet. Aside from that, Rocky is a sweet and handsome boy! He is eager to win over his new family's heart with his great personality. He is well behaved and house broken.", "Iris was found with her brother crated in the bushes in Miami Beach, FL. Why they were both abandoned in such a sad way, we do not know. Iris is the prefect pup! She is playful and sweet and ready to find her forever family. Iris is active and does well with adults and kids. She is a bright little pup who is partially house broken."]
    
    
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
