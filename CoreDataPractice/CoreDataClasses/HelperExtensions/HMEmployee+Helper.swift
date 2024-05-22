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
        if let passport = employee.passport {
            let hmPassport = HMPassport(context: context, passport: passport)
            toPassport = hmPassport
        }
    }
    
    func updateEmployeeDetails(from employee: Employee) {
        name = employee.name
        email = employee.email
        profilePicture = employee.profilePicture
        if let passport = employee.passport {
            if toPassport == nil {
                let hmPassport = HMPassport(context: PersistentStorageManager.shared.context, passport: passport)
                toPassport = hmPassport
            } else {
                toPassport?.updatePassportDetails(from: passport)
            }
        } else {
            toPassport = nil
        }
    }
    
}
