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
    @IBOutlet private weak var passportNumberTextField: UITextField!
    @IBOutlet private weak var placeOfIssueTextField: UITextField!
    @IBOutlet private weak var createButton: UIButton!
    @IBOutlet private weak var updateButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!
    
    private lazy var imagePicker = UIImagePickerController()
    private let manager: EmployeeManager = EmployeeManager()
    private var isImageUpdated: Bool = false
    var employee: Employee? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        let isEditingEmployeeDetails = employee != nil
        DispatchQueue.main.async {
            self.createButton.isHidden = isEditingEmployeeDetails
            self.updateButton.isHidden = !isEditingEmployeeDetails
            self.deleteButton.isHidden = !isEditingEmployeeDetails
            if let employee = self.employee {
                if let imageData = employee.profilePicture, !imageData.isEmpty {
                    self.profileImageView.image = UIImage(data: imageData)
                } else {
                    self.profileImageView.image = UIImage(systemName: "person.crop.circle.fill")
                }
                self.nameTextField.text = employee.name
                self.emailTextField.text = employee.email
                if let passport = employee.passport {
                    self.passportNumberTextField.text = passport.passportId
                    self.placeOfIssueTextField.text = passport.placeOfIssue
                }
            }
        }
    }
    
    // MARK: - User Actions
    
    @IBAction private func createButtonTapped(_ sender: Any) {
        if nameTextField.text.validate.isEmpty {
            debugPrint("Name can not be empty")
        } else if emailTextField.text.validate.isEmpty {
            debugPrint("Email can not be empty")
        } else if let image = profileImageView.image {
            var passport: Passport?
            if !passportNumberTextField.text.validate.isEmpty {
                passport = Passport(id: UUID(), passportId: passportNumberTextField.text.validate, placeOfIssue: placeOfIssueTextField.text.validate)
            }
            let profilePicture: Data? = isImageUpdated ? image.pngData() : nil
            let employee = Employee(id: UUID(), name: nameTextField.text.validate, email: emailTextField.text.validate, profilePicture: profilePicture, passport: passport)
            manager.createEmployee(employee)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction private func updateButtonTapped(_ sender: Any) {
        if var employee = self.employee, let image = profileImageView.image {
            employee.name = nameTextField.text.validate
            employee.email = emailTextField.text.validate
            employee.profilePicture = image.pngData()
            var passport: Passport?
            if !passportNumberTextField.text.validate.isEmpty {
                passport = Passport(id: employee.passport?.id ?? UUID(), passportId: passportNumberTextField.text.validate, placeOfIssue: placeOfIssueTextField.text.validate)
            }
            employee.passport = passport
            _ = manager.updateEmployee(employee)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction private func deleteButtonTapped(_ sender: Any) {
        if let employee = self.employee {
            displayAlert(with: "Delete Employee!", message: "Are you sure you want to delete this employee?", actions: [.ok, .cancel]) { [weak self] action in
                guard let `self` = self else { return }
                switch action {
                case .ok:
                    _ = self.manager.deleteEmployee(with: employee.id)
                    self.navigationController?.popViewController(animated: true)
                case .cancel, .custom:
                    break
                }
            }
        }
    }
    
    @IBAction private func profilePictureTapped(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }

}

extension CreateAndEditEmployeeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            profileImageView.image = pickedImage
            isImageUpdated = true
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
