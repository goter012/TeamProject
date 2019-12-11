//
//  SearchController.swift
//  TeamProject
//
//  Created by guillermo j otero jr on 11/22/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation
import UIKit


class SearchController: UIViewController{
    let model = tableModel.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    @IBOutlet weak var filterButton: UIButton!
    
    @IBAction func filterPressed(_ sender: Any) {
        
        let optionMenu = UIAlertController(title: nil,message:"Choose Filter",preferredStyle:.actionSheet)
        
        let nameAction = UIAlertAction(title:"Name",style:.default,handler:{(alert:UIAlertAction) in self.model.sortingAttribute = "name"})
        let breedAction = UIAlertAction(title:"Breed",style:.default,handler:{(alert:UIAlertAction) in self.model.sortingAttribute = "breed"})
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        optionMenu.addAction(nameAction)
        optionMenu.addAction(breedAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu,animated:true,completion:nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        filterButton.backgroundColor = .clear
        filterButton.layer.cornerRadius = 5
        filterButton.layer.borderWidth = 1
        filterButton.layer.borderColor = UIColor.blue.cgColor
    }
}
