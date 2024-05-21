//
//  EmployeeRepository.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

protocol EmployeeRepository {
    func create(employee: Employee)
    func getAllEmployees() -> [Employee]
    func getEmployee(withIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(id: UUID) -> Bool
}


struct EmployeeDataRepository: EmployeeRepository {
    
    func create(employee: Employee) {
        _ = HMEmployee(context: PersistentStorageManager.shared.context, employee: employee)
        PersistentStorageManager.shared.saveContext()
    }
    
    func getAllEmployees() -> [Employee] {
        if let results = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMEmployee.self) {
            let employees = results.map({ Employee(hmEmployee: $0) })
            return employees
        }
        return []
    }
    
    func getEmployee(withIdentifier id: UUID) -> Employee? {
        guard let result = getHMEmployee(withIdentifier: id) else {
            return nil
        }
        return Employee(hmEmployee: result)
    }
    
    func update(employee: Employee) -> Bool {
        guard let hmEmployee = getHMEmployee(withIdentifier: employee.id) else {
            return false
        }
        hmEmployee.updateEmployeeDetails(from: employee)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        guard let hmEmployee = getHMEmployee(withIdentifier: id) else {
            return false
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
