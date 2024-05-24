//
//  PassportViewController.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import UIKit

class PassportViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: PassportViewModel = PassportViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchAllPassportsList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension PassportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let passport = viewModel.getPassport(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: "PassportTableViewCell") as? PassportTableViewCell else {
            return UITableViewCell()
        }
        cell.populatePassportDate(passport)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
