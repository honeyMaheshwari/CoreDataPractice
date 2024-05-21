//
//  EmployeesListViewModel.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

class EmployeesListViewModel {
    
    private let manager: EmployeeManager = EmployeeManager()
    var employees: [Employee] = []
    
    func fetchAllEmployeesList() {
        employees = manager.fetchAllEmployees()
    }
}

extension EmployeesListViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return employees.count
    }
    
    func getEmployee(at indexPath: IndexPath) -> Employee? {
        return employees[safe: indexPath.row]
    }
    
}
