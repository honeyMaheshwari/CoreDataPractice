//
//  HMVehicle+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//
//

import Foundation
import CoreData


extension HMVehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HMVehicle> {
        return NSFetchRequest<HMVehicle>(entityName: "HMVehicle")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var type: String?
    @NSManaged public var model: String?
    @NSManaged public var registrationNumber: String?
    @NSManaged public var toPerson: HMPerson?

}

extension HMVehicle : Identifiable {

}
