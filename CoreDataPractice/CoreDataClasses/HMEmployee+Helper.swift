//
//  HMEmployee+Helper.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import Foundation
import CoreData

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
