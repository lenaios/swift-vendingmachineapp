//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Milk: Drink, CustomStringConvertible {
    private let farmCode: String
    private let expriryDate: Date
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, farmCode: String, expriryDate: Date, temperature: Int) {
        self.farmCode = farmCode
        self.expriryDate = expriryDate
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, temperature: temperature)
    }
}
