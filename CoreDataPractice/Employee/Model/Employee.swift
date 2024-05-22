//
//  Employee.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

struct Employee {
    let id: UUID
    var name, email: String
    var profilePicture: Data?
    var passport: Passport?
}

extension Employee {
    
    init(hmEmployee: HMEmployee) {
        name = hmEmployee.name.validate
        email = hmEmployee.email.validate
        id = hmEmployee.id ?? UUID()
        profilePicture = hmEmployee.profilePicture
        if let hmPassport = hmEmployee.toPassport {
            passport = Passport(hmPassport: hmPassport)
        }
    }
    
}
