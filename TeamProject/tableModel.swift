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
    
    static let sharedInstance = tableModel()
    
    var dogs: [Dog] = []
    
    
    init(){
        createDog(age:"1",breed:"Corgi",description:"Something",name:"Chico",dogPicPath:"")
        
    }
    
    func createDog(age:String, breed: String,description:String,name:String,dogPicPath: String){
        let dog = Dog(context:data.context)
        
        dog.age = age
        dog.breed = breed
        dog.dogDescription = description
        dog.name = name
        //dog.dogPic = dogPicPath
        data.saveContext()
        dogs.append(dog)
    }
    
    func showDogs(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dog")
        
        do{
            let result = try data.context.fetch(fetchRequest) as! [Dog]
            dogs = result
            
        }catch{
            print("Failed to return dogs")
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
