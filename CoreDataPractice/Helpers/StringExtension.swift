//
//  StringExtension.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

extension Optional where Wrapped == String {
    
    var validate: String {
        return self ?? ""
    }
    
    var intValue: Int {
        return Int(validate) ?? 0
    }
    
}
