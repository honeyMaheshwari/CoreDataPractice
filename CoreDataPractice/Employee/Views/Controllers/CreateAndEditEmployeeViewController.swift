//
//  CreateAndEditEmployeeViewController.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import UIKit

class CreateAndEditEmployeeViewController: UIViewController {

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var createButton: UIButton!
    @IBOutlet private weak var updateButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!
    
    private let manager: EmployeeManager = EmployeeManager()
    var employee: Employee? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            debugPrint(path)
        }
        setupUI()
    }
    //person.crop.circle.fill
    
    // MARK: - Private Methods
    
    private func setupUI() {
        let isEditingEmployeeDetails = employee != nil
        DispatchQueue.main.async {
            self.createButton.isHidden = isEditingEmployeeDetails
            self.updateButton.isHidden = !isEditingEmployeeDetails
            self.deleteButton.isHidden = !isEditingEmployeeDetails
            if let employee = self.employee {
                if let imageData = employee.profilePicture {
                    self.profileImageView.image = UIImage(data: imageData)
                }
                self.nameTextField.text = employee.name
                self.emailTextField.text = employee.email
            }
        }
    }
    
    // MARK: - User Actions
    
    @IBAction private func createButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction private func updateButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction private func deleteButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction private func profilePictureTapped(_ sender: Any) {
        
    }
    

}
