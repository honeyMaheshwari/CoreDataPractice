//
//  PersistentStorageManager.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 20/05/24.
//

import Foundation
import CoreData

final class PersistentStorageManager {
    
    static let shared = PersistentStorageManager()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataPractice")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Initializers
    
    private init() {
        
    }
    
    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fecth Object
    
    func fetchManagedObject<T: NSManagedObject>(manageObject: T.Type, predicate: NSPredicate? = nil) -> [T]? {
        do {
            let fetchRequest = NSFetchRequest<T>(entityName: T.nameOfClass)
            if let predicate = predicate {
                fetchRequest.predicate = predicate
            }
            let result = try PersistentStorageManager.shared.context.fetch(fetchRequest)
            return result
        } catch let error {
            debugPrint("fetchManagedObject error -> \(error)")
        }
        return nil
    }
    
}
