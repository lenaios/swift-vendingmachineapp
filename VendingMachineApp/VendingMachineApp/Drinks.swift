//
//  Drinks.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Drinks {
    private var drinks: [Drink: Int]
    
    init(drinks: [Drink: Int]) {
        self.drinks = drinks
    }
    
    func add(drink: Drink) {
        guard var stock = drinks[drink] else {
            drinks[drink] = 1
            return
        }
        stock += 1
    }
    
    func getAvailableDrinks(with coins: Int) -> [Drink] {
        let availableDrinks = drinks.keys.filter { (drink: Drink) -> Bool in
            return drink.price <= coins
        }
        return availableDrinks
    }
    
    func remove(drink: Drink) {
        guard var stock = drinks[drink] else {
            return
        }
        stock -= 1
    }
}