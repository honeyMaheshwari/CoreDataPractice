//
//  PersonRepository.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

protocol PersonRepository: BaseRepository where T == Person {

}

struct PersonDataRepository: PersonRepository {
    
    func create(record: Person) {
        _ = HMPerson(context: PersistentStorageManager.shared.context, person: record)
        PersistentStorageManager.shared.saveContext()
    }
    
    func getAll() -> [Person] {
        if let results = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMPerson.self) {
            let persons = results.map({ Person(hmPerson: $0) })
            return persons
        }
        return []
    }
    
    func get(using id: UUID) -> Person? {
        guard let result = getHMPerson(withIdentifier: id) else {
            return nil
        }
        return Person(hmPerson: result)
    }
    
    func update(record: Person) -> Bool {
        guard let hmPerson = getHMPerson(withIdentifier: record.id) else {
            return false
        }
        hmPerson.updatePersonDetails(from: record)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    func delete(using id: UUID) -> Bool {
        guard let hmPerson = getHMPerson(withIdentifier: id) else {
            return false
        }
        PersistentStorageManager.shared.context.delete(hmPerson)
        PersistentStorageManager.shared.saveContext()
        return true
    }

    private func getHMPerson(withIdentifier id: UUID) -> HMPerson? {
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        guard let result = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMPerson.self, predicate: predicate)?.first else {
            return nil
        }
        return result
    }
    
}
