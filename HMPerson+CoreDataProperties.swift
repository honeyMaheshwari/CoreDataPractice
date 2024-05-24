//
//  HMPerson+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//
//

import Foundation
import CoreData


extension HMPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HMPerson> {
        return NSFetchRequest<HMPerson>(entityName: "HMPerson")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toVehicle: Set<HMVehicle>?

}

// MARK: Generated accessors for toVehicle
extension HMPerson {

    @objc(addToVehicleObject:)
    @NSManaged public func addToToVehicle(_ value: HMVehicle)

    @objc(removeToVehicleObject:)
    @NSManaged public func removeFromToVehicle(_ value: HMVehicle)

    @objc(addToVehicle:)
    @NSManaged public func addToToVehicle(_ values: Set<HMVehicle>)

    @objc(removeToVehicle:)
    @NSManaged public func removeFromToVehicle(_ values: Set<HMVehicle>)

}

extension HMPerson : Identifiable {

}
