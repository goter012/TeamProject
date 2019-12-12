//  PROGRAMMER: Team G (Elliott, Sacha, Guillermo)

//  PANTHERID:  5769664

//  CLASS:          COP 4655 T/TH 5:00

//  INSTRUCTOR:     Steve Luis  ECS 282

//  ASSIGNMENT:     Team Project

//  DUE:            Thursday 12/12/19

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
    // Searches for dog by name with search conditions
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
    
    // Segues to detail view
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
