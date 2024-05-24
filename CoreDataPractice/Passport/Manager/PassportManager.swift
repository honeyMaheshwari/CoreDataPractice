//
//  PassportManager.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

struct PassportManager {
    
    private let passportDataRepository = PassportDataRepository()

    func fetchAllPassports() -> [Passport] {
        return passportDataRepository.getAll()
    }
    
    func fetchPassport(withIdentifier id: UUID) -> Passport? {
        return passportDataRepository.get(using: id)
    }
    
    func updatePassport(_ passport: Passport) -> Bool {
        return passportDataRepository.update(record: passport)
    }
    
    func deletePassport(with id: UUID) -> Bool {
        return passportDataRepository.delete(using: id)
    }
    
}
