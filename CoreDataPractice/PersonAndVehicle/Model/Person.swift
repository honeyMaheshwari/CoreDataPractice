//
//  Person.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

struct Person {
    let id: UUID
    let name: String
    var vehicles: [Vehicle]?
}

extension Person {
    
    var displayVehicle: String {
        var text: String = "No Vehicles"
        if let vehicles = self.vehicles {
            text = ""
            for (index, vehicle) in vehicles.enumerated() {
                text += "\(index + 1). " + vehicle.displayText + (index == vehicles.count - 1 ? "" : "\n")
            }
        }
        return text
    }
    
    init(hmPerson: HMPerson) {
        id = hmPerson.id ?? UUID()
        name = hmPerson.name.validate
        if let set = hmPerson.toVehicle {
            vehicles = set.map({ Vehicle(hmVehicle: $0) })
        } 
    }
    
}
