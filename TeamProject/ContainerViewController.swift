//
//  ContainerViewController.swift
//  TeamProject
//
//  Created by sacha kai neptune arthurs on 12/10/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation

import UIKit
class ContainerViewController: UIViewController{

    
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.borderWidth = 10
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
    }
}
