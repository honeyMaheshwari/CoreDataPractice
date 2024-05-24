//
//  VehicleRepository.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

protocol VehicleRepository: BaseRepository where T == Vehicle {

}

struct VehicleDataRepository: VehicleRepository {
    
    func create(record: Vehicle) {
        _ = HMVehicle(context: PersistentStorageManager.shared.context, vehicle: record)
        PersistentStorageManager.shared.saveContext()
    }
    
    func getAll() -> [Vehicle] {
        if let results = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMVehicle.self) {
            let vehicles = results.map({ Vehicle(hmVehicle: $0) })
            return vehicles
        }
        return []
    }
    
    func get(using id: UUID) -> Vehicle? {
        guard let result = getHMVehicle(withIdentifier: id) else {
            return nil
        }
        return Vehicle(hmVehicle: result)
    }
    
    func update(record: Vehicle) -> Bool {
        guard let hmVehicle = getHMVehicle(withIdentifier: record.id) else {
            return false
        }
        hmVehicle.updateVehicleDetails(from: record)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    func delete(using id: UUID) -> Bool {
        guard let hmVehicle = getHMVehicle(withIdentifier: id) else {
            return false
        }
        PersistentStorageManager.shared.context.delete(hmVehicle)
        PersistentStorageManager.shared.saveContext()
        return true
    }
    
    private func getHMVehicle(withIdentifier id: UUID) -> HMVehicle? {
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        guard let result = PersistentStorageManager.shared.fetchManagedObject(manageObject: HMVehicle.self, predicate: predicate)?.first else {
            return nil
        }
        return result
    }
    
}
