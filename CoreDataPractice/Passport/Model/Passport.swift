//
//  Passport.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import Foundation

struct Passport {
    let id: UUID
    let passportId, placeOfIssue: String
}

extension Passport {
    
    init(hmPassport: HMPassport) {
        id = hmPassport.id ?? UUID()
        passportId = hmPassport.passportId.validate
        placeOfIssue = hmPassport.placeOfIssue.validate
    }
    
}
