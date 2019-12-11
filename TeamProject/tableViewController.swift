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

class tableViewController: UITableViewController{
    
    let dogs = tableModel.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
        tableView.reloadData()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        
        let dog = dogs.dogs[indexPath.row]
        
        
       
        
        cell.dogPic.image = UIImage(named:dog.dogPic!)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 185.0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        
        switch segue.identifier {
        case "showDog"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the contact associated with this row and pass it along
                let dog = dogs.dogs[row]
                let detailViewController = segue.destination as! detailViewController
                detailViewController.dog = dog
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}
