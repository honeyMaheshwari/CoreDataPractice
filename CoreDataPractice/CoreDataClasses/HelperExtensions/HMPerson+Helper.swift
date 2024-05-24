//
//  HMPerson+Helper.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation
import CoreData

extension HMPerson {
    
    convenience init(context: NSManagedObjectContext, person: Person) {
        self.init(context: context)
        id = person.id
        name = person.name
        if let vehicles = person.vehicles {
            let array = vehicles.map({ HMVehicle(context: context, vehicle: $0) })
            let set: Set<HMVehicle> = Set(array)
            toVehicle = set
        }
    }
    
    func updatePersonDetails(from person: Person) {
        name = person.name
        if let vehicles = person.vehicles {
            let array = vehicles.map({ HMVehicle(context: PersistentStorageManager.shared.context, vehicle: $0) })
            let set: Set<HMVehicle> = Set(array)
            toVehicle = set
        } else {
            toVehicle = nil
        }
    }
    
}
