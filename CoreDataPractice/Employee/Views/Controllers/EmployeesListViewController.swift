//
//  EmployeesListViewController.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import UIKit

class EmployeesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let employee = sender as? Employee, let destinationController = segue.destination as? CreateAndEditEmployeeViewController {
            destinationController.employee = employee
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction private func createNewEmployee(_ sender: Any) {
        performSegue(withIdentifier: "segueShowDetail", sender: sender)
    }
    
}
