//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 20/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchEmployee()
    }

    func createEmployee() {
        let employee = Employee(context: PersistentStorageManager.shared.context)
        employee.name = "Nishi"
        PersistentStorageManager.shared.saveContext()
    }
    
    func fetchEmployee() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        do {
            guard let result = try PersistentStorageManager.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else {
                return
            }
            result.forEach({
                debugPrint($0.name ?? "")
            })
        } catch let error {
            debugPrint(error)
        }
    }
}

