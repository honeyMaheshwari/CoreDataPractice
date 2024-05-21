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
        employeeDataRepository.create(employee: employee)
    }
    
    func fetchAllEmployees() -> [Employee] {
        return employeeDataRepository.getAllEmployees()
    }
    
    func fetchEmployee(withIdentifier id: UUID) -> Employee? {
        return employeeDataRepository.getEmployee(withIdentifier: id)
    }
    
    func updateEmployee(_ employee: Employee) -> Bool {
        return employeeDataRepository.update(employee: employee)
    }
    
    func deleteEmployee(with id: UUID) -> Bool {
        return employeeDataRepository.delete(id: id)
    }
    
}
