//
//  DataProvider.swift
//  SwiftProgrammers
//
//  Created by Jonas Hansen on 23/09/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import Foundation

class DataProvider{
    static var sharedInstance : DataProvider = DataProvider()
    var memberNames : [String]
    var memberPersons : [Person]
    
    private init(){
        memberNames = ["Jonas","Michi","Stefi","Silvio"]
        
        memberPersons = [
            Person(firstname: "Jonas", lastname: "Hansen", plz: 6218),
            Person(firstname: "Michi", lastname: "Zurmühle", plz: 1),
            Person(firstname: "Stefanie", lastname: "Vogel", plz: 2),
            Person(firstname: "Silvio", lastname: "Stappung", plz: 1337),
            Person(firstname: "Rainer", lastname: "Winkler", plz: 91448)
        ]
    }
}