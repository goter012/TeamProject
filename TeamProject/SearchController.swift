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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
