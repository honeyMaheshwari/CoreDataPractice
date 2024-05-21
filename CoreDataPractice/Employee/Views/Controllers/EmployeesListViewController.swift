//
//  EmployeesListViewController.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import UIKit

class EmployeesListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: EmployeesListViewModel = EmployeesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchAllEmployeesList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        performSegue(withIdentifier: "segueShowDetail", sender: nil)
    }
    
}

extension EmployeesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let employee = viewModel.getEmployee(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell") as? EmployeeTableViewCell else {
            return UITableViewCell()
        }
        cell.populateEmployeeData(employee)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let employee = viewModel.getEmployee(at: indexPath) else {
            return
        }
        performSegue(withIdentifier: "segueShowDetail", sender: employee)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
