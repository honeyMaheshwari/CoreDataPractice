//
//  PersonViewController.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let viewModel: PersonViewModel = PersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshPersonsListData()
    }
    
    private func refreshPersonsListData() {
        viewModel.fetchAllPersonsList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction private func createDummyPerson(_ sender: Any) {
        viewModel.createDummyPerson()
        refreshPersonsListData()
    }
    
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let person = viewModel.getPerson(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell") as? PersonTableViewCell else {
            return UITableViewCell()
        }
        cell.populatePersonData(person)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            displayAlert(with: "Delete Person!", message: "Are you sure you want to delete this person?", actions: [.ok, .cancel]) { [weak self] action in
                guard let `self` = self else { return }
                switch action {
                case .ok:
                    let status = self.viewModel.deletePerson(at: indexPath)
                    if status {
                        DispatchQueue.main.async { [weak self] in
                            self?.tableView.beginUpdates()
                            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
                            self?.tableView.endUpdates()
                        }
                    }
                case .cancel, .custom:
                    break
                }
            }
        default:
            break
        }
    }
    
}
