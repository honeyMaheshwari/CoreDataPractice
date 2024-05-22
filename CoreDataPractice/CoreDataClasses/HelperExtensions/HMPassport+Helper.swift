//
//  HMPassport+Helper.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import Foundation
import CoreData

extension HMPassport {
    
    convenience init(context: NSManagedObjectContext, passport: Passport) {
        self.init(context: context)
        id = passport.id
        passportId = passport.passportId
        placeOfIssue = passport.placeOfIssue
    }
    
    func updatePassportDetails(from passport: Passport) {
        passportId = passport.passportId
        placeOfIssue = passport.placeOfIssue
    }

}
