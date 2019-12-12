//
//  tableViewController.swift
//  TeamProject
//
//  Created by Gemma Velasco on 12/5/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class tableViewController: UITableViewController,UISearchBarDelegate{
    
    let dogs = tableModel.sharedInstance
    
    let data = PersistenceManager.shared
    
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    @IBOutlet weak var searchBar: UISearchBar!
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dog")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"name",ascending:true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest:fetchRequest,managedObjectContext:data.context,sectionNameKeyPath:nil,cacheName:nil)
        searchBar.delegate = self
        
       
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        do{
            try fetchedResultsController.performFetch()
        }catch{
            print("Core Data: couldnt fetch dogs")
        }
        
        tableView.reloadData()
        
        
        
        
    }
    
    func reconstructFetchResults(){
        fetchedResultsController = NSFetchedResultsController(fetchRequest:fetchRequest,managedObjectContext:data.context,sectionNameKeyPath:nil,cacheName:nil)
        do {try fetchedResultsController.performFetch()}
        catch {print("CoreData: couldnt fetch events")}
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        dogs.selectedDog = fetchedResultsController.object(at:indexPath) as! Dog
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
        if(searchText != ""){
            fetchRequest.predicate = NSPredicate(format:"name CONTAINS[cd] %@",searchText)
            reconstructFetchResults()
            
        }else{
            fetchRequest.predicate = nil
            reconstructFetchResults()
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        
        let dog = fetchedResultsController.object(at:indexPath) as! Dog
        cell.selectionStyle = .none
        cell.dogPic.image = UIImage(named:dog.dogPic!)
        cell.nameLabel.text = dog.name
        cell.breedLabel.text = dog.breed
        cell.layer.borderColor = UIColor .gray.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        
        switch segue.identifier {
        case "showDog"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the contact associated with this row and pass it along
               
                let detailViewController = segue.destination as! detailViewController
                
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}
