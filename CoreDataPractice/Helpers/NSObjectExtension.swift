//
//  NSObjectExtension.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return String(describing: self)
    }
    
    var nameOfClass: String {
        return type(of: self).nameOfClass
    }
    
}
