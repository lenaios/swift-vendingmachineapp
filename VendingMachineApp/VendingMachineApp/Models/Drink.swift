//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drink {
    private let manufacturer: String
    private let volume: Int
    private let name: String
    private let manufacturedAt: Date
    private let expiredAt: Date
    private(set) var price: Int
    private var temperature: Int
    private var calorie: Int
    var description: String {
        return "\(manufacturer), \(volume)ml, \(price)원, \(name), \(Date.dateFormatter(date: manufacturedAt))"
    }
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, temperature: Int, calorie: Int, expiredAt: Date) {
        self.manufacturer = manufacturer
        self.volume = volume
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.price = price
        self.temperature = temperature
        self.calorie = calorie
        self.expiredAt = expiredAt
    }
}

extension Drink: Drinkable {
    func validateExpiredAt(with date: Date) -> Bool {
        return expiredAt <= date
    }
    
    func isHot(with temperature: Int) -> Bool {
        return self.temperature > temperature
    }
    
    func isLowCalorie(with calorie: Int) -> Bool {
        return self.calorie > calorie
    }
}

extension Drink: Hashable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.manufacturer == rhs.manufacturer && lhs.volume == rhs.volume && lhs.name == rhs.name && lhs.price == rhs.price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(manufacturer)
        hasher.combine(volume)
        hasher.combine(name)
        hasher.combine(price)
    }
}
