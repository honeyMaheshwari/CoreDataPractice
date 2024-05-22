//
//  EmployeeManager.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

struct EmployeeManager {
    
    private let employeeDataRepository = EmployeeDataRepository()
    
    func createEmployee(_ employee: Employee) {
        employeeDataRepository.create(record: employee)
    }
    
    func fetchAllEmployees() -> [Employee] {
        return employeeDataRepository.getAll()
    }
    
    func fetchEmployee(withIdentifier id: UUID) -> Employee? {
        return employeeDataRepository.get(using: id)
    }
    
    func updateEmployee(_ employee: Employee) -> Bool {
        return employeeDataRepository.update(record: employee)
    }
    
    func deleteEmployee(with id: UUID) -> Bool {
        return employeeDataRepository.delete(using: id)
    }
    
}
