//
//  HMVehicle+Helper.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation
import CoreData

extension HMVehicle {
    
    convenience init(context: NSManagedObjectContext, vehicle: Vehicle) {
        self.init(context: context)
        id = vehicle.id
        type = vehicle.type.rawValue
        model = vehicle.model
        registrationNumber = vehicle.registrationNumber
    }
    
    func updateVehicleDetails(from vehicle: Vehicle) {
        type = vehicle.type.rawValue
        model = vehicle.model
        registrationNumber = vehicle.registrationNumber
    }
    
}
