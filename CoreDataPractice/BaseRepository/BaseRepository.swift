//
//  BaseRepository.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import Foundation

protocol BaseRepository {
    
    associatedtype T
    
    func create(record: T)
    func getAll() -> [T]
    func get(using id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(using id: UUID) -> Bool
}
