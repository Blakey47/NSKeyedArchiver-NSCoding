//
//  Person.swift
//  NSKeyedArchiverNSCodingCareerFoundry
//
//  Created by Darragh on 2/2/18.
//  Copyright © 2018 Darragh. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    
    let firstName: String
    let lastName: String
    let country: String
    let age: Int
    
    init(firstName: String, lastName: String, country: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.country = country
        self.age = age
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let firstName = aDecoder.decodeObject(forKey: "firstName") as? String,
            let lastName = aDecoder.decodeObject(forKey: "lastName") as? String,
            let country = aDecoder.decodeObject(forKey: "country") as? String
            else { return nil }
        
        self.init(firstName: firstName, lastName: lastName, country: country, age: aDecoder.decodeInteger(forKey: "age"))
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.firstName, forKey: "firstName")
        aCoder.encode(self.lastName, forKey: "lastName")
        aCoder.encode(self.country, forKey: "country")
        aCoder.encode(self.age, forKey: "age")
    }
    
    override var description: String {
        return "\(firstName) \(lastName) \(country) \(age)"
    }
}

struct PersonIterator: IteratorProtocol {
    
    let firstNames = ["Jane", "John", "Stephen", "Stacy", "Taylor", "Alex", "Eren"]
    let lastNames = ["White", "Black", "Fox", "Jones", "King", "McQueen", "Yeager"]
    let countries = ["Ireland", "England", "France", "Germany", "Spain", "Denmark", "Sweden"]
    let ages = [25, 26, 20, 30, 27, 28, 23]
    
    mutating func next() -> Person? {
        let firstName = firstNames[Int(arc4random_uniform(UInt32(firstNames.count)))]
        let lastName = lastNames[Int(arc4random_uniform(UInt32(lastNames.count)))]
        let country = countries[Int(arc4random_uniform(UInt32(countries.count)))]
        let age = ages[Int(arc4random_uniform(UInt32(ages.count)))]
        let person = Person(firstName: firstName, lastName: lastName, country: country, age: age)
        return person
    }
}
