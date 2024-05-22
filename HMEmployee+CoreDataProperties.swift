//
//  HMEmployee+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//
//

import Foundation
import CoreData


extension HMEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HMEmployee> {
        return NSFetchRequest<HMEmployee>(entityName: "HMEmployee")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var toPassport: HMPassport?

}

extension HMEmployee : Identifiable {

}
