//
//  UIViewControllerExtension.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import UIKit

enum AlertActionType {
    case ok
    case cancel
    case custom(String)
    
    var title: String {
        switch self {
        case .ok: return "Ok"
        case .cancel: return "Cancel"
        case .custom(let title): return title
        }
    }
    
    var style: UIAlertAction.Style {
        switch self {
        case .ok: return .default
        case .cancel: return .cancel
        case .custom: return .default
        }
    }
    
}

extension UIViewController {
        
    func displayAlert(with title: String? = nil, message: String? = nil, actions: [AlertActionType], completion: @escaping (AlertActionType) -> Void) {
        guard presentedViewController == nil else {
            return
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            let alertAction = UIAlertAction(title: action.title, style: action.style) { _ in
                completion(action)
            }
            alertController.addAction(alertAction)
        }
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
}
