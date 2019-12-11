//
//  tableModel.swift
//  TeamProject
//
//  Created by Gemma Velasco on 12/9/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation



/*class dogs: NSObject {
    
    var name: String
    var breed: String
    
    init(name: String, breed: String){
        
        self.name = name
        self.breed = breed
        
    }
    
}

final class tableModel {
    
    static let sharedInstance = tableModel()
    
    private var dogsArr: [dogs] = [dogs(name: "Luci", breed: "Terrier Mix")]
    
    func numOfDogs () -> Int {
        
        return dogsArr.count
        
    }
    
    func getDogs () -> [dogs] {
        
        return dogsArr
        
    }
    
}*/

import Foundation
import CoreData

let data = PersistenceManager.shared

final class tableModel{
    
     let dateFormatter = DateFormatter()
    
    var sortingAttribute = ""
    
    var currentEmail:String = ""
    var currentPassword: String = ""
    static let sharedInstance = tableModel()
    
    var dogs: [Dog] = []
    let breeds = ["Terrier Mix","Lab Mix","Beagle Mix","Yorkie","Beagle Mix"]
    let dogNames = ["Luci","Hope","Tito","Rocky","Cheeto"]
    let ages = ["9 months", "2 Years", "8 Years","1 Year","4 Years"]
    let descriptions = ["Luci was found by a couple in Miami Beach. She was roaming the streets without a collar or tag. They were able to offer her a temporary home for a while. The couple wasn't able to find her a permanent home and was moving out of state and wouldn't be able to take her with them. They faced a tough decision and almost had to resort to taking Luci to the local shelter. Luci was welcomed into ResQMe and is now available for adoption. She is sweet, crate trained, and house broken. She loves cuddles and her squeeky toys and will make a great addition to any family! ","Hope is an example of complete abandonement. She was found in a nursery in Redland, Fl. Hope gave birth to 5 puppies there. She had to protect them against everything including the weather. So much so that 2 of her puppies had gone missing when she was brought in to ResQMe. After searching and finally locating all puppies, this little family was safe. All of Hope's puppies have since then been adopted but Hope remains at the rescue. She is a lovebug and the perfect companion to realx and watch TV with. She also loves to play outside with her favorite ball! ","Tito had a mom who adored him but unfortunatley, she passed away. Her son allowed Tito to stay with him temporarily but he wasn't really wanted. Tito would have ended up in the local shelter if we would not have rescued him. Tito has lived through such a traumatic situtaion that no sweet pup should have to endure. Tito is such a grateful little dog who is ready to give so much love! ","Rocky comes from very irresponsible owners. They surrendered Rocky claiming they had no time for him. He was taken to the vet where we found he was mostly healthy but had not lost many of his baby teeth resulting in multiple teeth. Rocky will soon have his extra baby teeth surgically removed, as per the vet. Aside from that, Rocky is a sweet and handsome boy! He is eager to win over his new family's heart with his great personality. He is well behaved and house broken.","Cheeto was found running a on the side of a very busy street. He had a collor that was tied to a broken chain. He was extremely skinny and malnourished with his ribs and bones showing. Because of the condition he was in, it is assumed Cheeto had run away from his owner who had him tied up and clearly underfed. After a few weeks of healthy, nutritious meals, Cheeto finally gained a healthy amount of weight. Cheeto has been with us the longest and continues to search for his forever family. Cheeto is playful, loves car rides and his toys. Cheeto is house broken and knows how to sit on command. He is an all around good boy! "]
    let genders = ["Female","Female","Male","Male","Male"]
    let weights = ["28 lbs","46 lbs","15 lbs","10 lbs","60 lbs"]
    
    //let dogColors
    
    //NEED TO ADD COLOR AS ATTRIBUTE TO DOG ENTITY
    init(){
        
        
        for i in 0...4{
            createDog(age:ages[i],breed:breeds[i],description:descriptions[i],name:dogNames[i],dogPicPath:dogNames[i],sex:genders[i],size:weights[i])
        }
        
    }
    
    func createDog(age:String, breed: String,description:String,name:String,dogPicPath: String,sex:String,size:String){
        let dog = Dog(context:data.context)
        
        dog.age = age
        dog.breed = breed
        dog.dogDescription = description
        dog.name = name
        dog.dogPic = dogPicPath
        dog.sex = sex
        dog.size = size
        data.saveContext()
        dogs.append(dog)
        
        print("Dog created")
    }
    
    func showDogs() -> [Dog]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dog")
        
        do{
            let result = try data.context.fetch(fetchRequest) as! [Dog]
            dogs = result
            
        }catch{
            print("Failed to return dogs")
        }
        
        return dogs
    }
    
    
    func recordCurrentUser(_ email:String, _ password:String){
        currentEmail = email
        currentPassword = password
    }
    
    func createUser(_ name:String,_ email:String,_ password: String, _ phoneNumber:String ) -> Bool{
        let user = User(context:data.context)
        
        user.email = email
        user.name = name
        user.phoneNumber = phoneNumber
        user.password = password
        user.picture  = "Anonymous"
        user.dateOfBirth = "1-Jan-2019"
        data.saveContext()
        
        recordCurrentUser(email, password)
        return true
    }
    
    
   
    func fetchUser() -> User {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        fetchRequest.predicate = NSPredicate(format:"email = %@ && password = %@",currentEmail,currentPassword)
        do{
            let user = try data.context.fetch(fetchRequest)
            let object = user[0] as! User
            return object
        }catch{
            print("Error")
        }
        return User()
    }
    func logOutUser(){
        currentEmail = ""
        currentPassword = ""
    }
    
    
    func updateUser(name:String,email:String,phone:String,dateOfBirth:String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        
        fetchRequest.predicate = NSPredicate(format:"password = %@",currentPassword)
        
        do{
            let test = try data.context.fetch(fetchRequest)
            let objectUpdate = test[0] as! User
            objectUpdate.setValue(name,forKey:"name")
            objectUpdate.setValue(email,forKey:"email")
            objectUpdate.setValue(phone, forKey: "phoneNumber")
            objectUpdate.setValue(dateOfBirth,forKey:"dateOfBirth")
            
            do{
                try data.context.save()
                recordCurrentUser(email, currentPassword)
            }catch{
                print("Error")
            }
        }catch{
            print("Error trying to update")
        }
    }
    func updateDog(age:String, breed:String,description:String, name:String,dogPicPath:String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dog")
        
        fetchRequest.predicate = NSPredicate(format:"name = %@",name)
        
        do{
            let test = try data.context.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(age,forKey:"age")
            objectUpdate.setValue(breed, forKey: "breed")
            objectUpdate.setValue(description,forKey:"description")
            do{
                try data.context.save()
            }catch{
                print("Error")
            }
        }catch{
            print("Error trying to update")
        }
    }
    
    func deleteDog(name:String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Dog")
        fetchRequest.predicate = NSPredicate(format:"name = %@",name)
        
        do{
            let test = try data.context.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            data.context.delete(objectToDelete)
            do{
                try data.context.save()
            }catch{
                print("Error saving deletion of dog")
            }
        }catch{
            print("Error deleting dog")
        }
    }
    
}
