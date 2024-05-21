//
//  HMEmployee+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//
//

import Foundation
import CoreData


extension HMEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HMEmployee> {
        return NSFetchRequest<HMEmployee>(entityName: "HMEmployee")
    }

    @NSManaged public var profilePicture: Data?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?

}

extension HMEmployee : Identifiable {

}

extension HMEmployee {
    
    convenience init(context: NSManagedObjectContext, employee: Employee) {
        self.init(context: context)
        name = employee.name
        email = employee.email
        id = employee.id
        profilePicture = employee.profilePicture
    }
    
    func updateEmployeeDetails(from employee: Employee) {
        name = employee.name
        email = employee.email
        profilePicture = employee.profilePicture
    }
    
}
