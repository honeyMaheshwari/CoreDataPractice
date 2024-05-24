//
//  PersonManager.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

struct PersonManager {
    
    private let personDataRepository = PersonDataRepository()
    
    func createPerson(record: Person) {
        personDataRepository.create(record: record)
    }

    func getAll() -> [Person] {
        return personDataRepository.getAll()
    }
    
    func delete(using id: UUID) -> Bool {
        return personDataRepository.delete(using: id)
    }
    
}
