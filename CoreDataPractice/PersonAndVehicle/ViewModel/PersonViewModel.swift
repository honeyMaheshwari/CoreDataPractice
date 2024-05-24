//
//  PersonViewModel.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

class PersonViewModel {
    
    private let manager: PersonManager = PersonManager()
    private var persons: [Person] = []
    
    func fetchAllPersonsList() {
        persons = manager.getAll()
        print("persons -> \(persons.count)")
    }
    
    func createDummyPerson() {
        let personName = "Person \(persons.count + 1)"
        let numberOfVehicles: Int = Int.random(in: 1...4)
        let types: [VehicleType] = VehicleType.allCases
        var vehicles: [Vehicle] = []
        for _ in 1...numberOfVehicles {
            let vehicleTypeIndex: Int = Int.random(in: 0...1)
            let type = types[vehicleTypeIndex]
            var model: String = ""
            switch type {
            case .car:
                let cars: [String] = ["Honda Civic", "Honda City", "Tata Altroz", "Tata  Harrier", "Tata Safari", "VolksWagen Virtus", "VolksWagen Polo", "Mahindra XUV-700", "Mahindra Thar" , "Mahindra Scorpio"]
                let carIndex: Int = Int.random(in: 0 ..< cars.count)
                model = cars[safe: carIndex] ?? "Car"
            case .bike:
                let bikes: [String] = ["OLA S1 X", "Ampere NXG", "Royal Enfield Bullet 350", "Hero Xtreme 125R", "Revolt RV400 BRZ", "Honda NX500", "Husqvarna Svartpilen 401", "Royal Enfield Shotgun 650", "Jawa 350", "Yamaha R15 V4"]
                let bikeIndex: Int = Int.random(in: 0 ..< bikes.count)
                model = bikes[safe: bikeIndex] ?? "Bike"
            }
            let registrationNumber = String.generateRandomString(length: 8)
            let vehicle = Vehicle(id: UUID(), type: type, model: model, registrationNumber: registrationNumber, ownerName: personName)
            vehicles.append(vehicle)
        }
        let person = Person(id: UUID(), name: personName, vehicles: vehicles)
        manager.createPerson(record: person)
    }
    
    func deletePerson(at indexPath: IndexPath) -> Bool {
        if let person = getPerson(at: indexPath) {
            let status = manager.delete(using: person.id)
            if status {
                persons.remove(at: indexPath.row)
            }
            return status
        }
        return false
    }
    
}

extension PersonViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return persons.count
    }
    
    func getPerson(at indexPath: IndexPath) -> Person? {
        return persons[safe: indexPath.row]
    }
    
}
