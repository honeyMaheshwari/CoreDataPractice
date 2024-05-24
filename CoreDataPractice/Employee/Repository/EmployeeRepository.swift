//
//  EmployeeRepository.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

protocol EmployeeRepository: BaseRepository where T == Employee {
    
}

struct EmployeeDataRepository: EmployeeRepository {
    
    func create(record: Employee) {
        _ = HMEmployee(context: PersistentStorageManager.shared.context, employee: record)
        PersistentStorageManager.shared.saveContext()
    }
    
    func getAll() -> [Employee] {
        if let results = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMEmployee.self) {
            let employees = results.map({ Employee(hmEmployee: $0) })
            return employees
        }
        return []
    }
    
    func get(using id: UUID) -> Employee? {
        guard let result = getHMEmployee(withIdentifier: id) else {
            return nil
        }
        return Employee(hmEmployee: result)
    }
    
    func update(record: Employee) -> Bool {
        guard let hmEmployee = getHMEmployee(withIdentifier: record.id) else {
            return false
        }
        hmEmployee.updateEmployeeDetails(from: record)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    func delete(using id: UUID) -> Bool {
        guard let hmEmployee = getHMEmployee(withIdentifier: id) else {
            return false
        }
        if let hmPassport = hmEmployee.toPassport {
            PersistentStorageManager.shared.context.delete(hmPassport)
        }
        PersistentStorageManager.shared.context.delete(hmEmployee)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    private func getHMEmployee(withIdentifier id: UUID) -> HMEmployee? {
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        guard let result = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMEmployee.self, predicate: predicate)?.first else {
            return nil
        }
        return result
    }
}
