//
//  PassportRepository.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import Foundation

protocol PassportRepository: BaseRepository where T == Passport {
    
}

struct PassportDataRepository: PassportRepository {
    
    func create(record: Passport) {
        _ = HMPassport(context: PersistentStorageManager.shared.context, passport: record)
        PersistentStorageManager.shared.saveContext()
    }
    
    func getAll() -> [Passport] {
        if let results = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMPassport.self) {
            let passports = results.map({ Passport(hmPassport: $0) })
            return passports
        }
        return []
    }
    
    func get(using id: UUID) -> Passport? {
        guard let result = getHMPassport(withIdentifier: id) else {
            return nil
        }
        return Passport(hmPassport: result)
    }
    
    func update(record: Passport) -> Bool {
        guard let hmPassport = getHMPassport(withIdentifier: record.id) else {
            return false
        }
        hmPassport.updatePassportDetails(from: record)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    func delete(using id: UUID) -> Bool {
        guard let hmPassport = getHMPassport(withIdentifier: id) else {
            return false
        }
        PersistentStorageManager.shared.context.delete(hmPassport)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    private func getHMPassport(withIdentifier id: UUID) -> HMPassport? {
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        guard let result = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMPassport.self, predicate: predicate)?.first else {
            return nil
        }
        return result
    }

}
