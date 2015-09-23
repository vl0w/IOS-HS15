//
//  Person.swift
//  SwiftProgrammers
//
//  Created by Jonas Hansen on 23/09/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import Foundation

class Person{
    var firstname:String
    var lastname:String
    var plz:Int
    
    init(firstname:String, lastname:String, plz:Int){
        self.firstname = firstname
        self.lastname = lastname
        self.plz = plz
    }
}