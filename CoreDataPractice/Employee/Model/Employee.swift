//
//  Employee.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

struct Employee {
    let id: UUID
    let name, email: String
    let profilePicture: Data?
}

extension Employee {
    
    init(hmEmployee: HMEmployee) {
        name = hmEmployee.name ?? ""
        email = hmEmployee.email ?? ""
        id = hmEmployee.id ?? UUID()
        profilePicture = hmEmployee.profilePicture
    }
    
}
