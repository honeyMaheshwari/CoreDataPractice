//
//  PassportViewModel.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import Foundation

class PassportViewModel {
    
    private let manager = PassportManager()
    private var passports: [Passport] = []
    
    func fetchAllPassportsList() {
        passports = manager.fetchAllPassports()
        print(passports.count)
    }
    
}

extension PassportViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return passports.count
    }
    
    func getPassport(at indexPath: IndexPath) -> Passport? {
        return passports[safe: indexPath.row]
    }
    
}
