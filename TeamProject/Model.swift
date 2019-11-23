//
//  Model.swift
//  TeamProject
//
//  Created by guillermo j otero jr on 11/22/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation

struct User_1{
    var email:String
    var password: String

}
final class Model{
    
   
    static let sharedInstance = Model()
    var Users:[User_1]
    
    
}
