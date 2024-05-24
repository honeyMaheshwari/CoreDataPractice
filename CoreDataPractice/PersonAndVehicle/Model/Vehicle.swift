//
//  Vehicle.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

enum VehicleType: String, CaseIterable {
    case car
    case bike
}

struct Vehicle {
    let id: UUID
    let type: VehicleType
    let model, registrationNumber, ownerName: String
    
    var displayText: String {
        "\(model) (\(type.rawValue.capitalized))"
    }
}

extension Vehicle {
    
    init(hmVehicle: HMVehicle) {
        id = hmVehicle.id ?? UUID()
        type = VehicleType(rawValue: hmVehicle.type.validate) ?? .car
        model = hmVehicle.model.validate
        registrationNumber = hmVehicle.registrationNumber.validate
        ownerName = ""
    }
    
}


