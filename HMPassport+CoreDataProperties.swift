//
//  HMPassport+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//
//

import Foundation
import CoreData


extension HMPassport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HMPassport> {
        return NSFetchRequest<HMPassport>(entityName: "HMPassport")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var passportId: String?
    @NSManaged public var placeOfIssue: String?
    @NSManaged public var toEmployee: HMEmployee?

}

extension HMPassport : Identifiable {

}
