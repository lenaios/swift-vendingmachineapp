//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

struct VendingMachine {
    private var drinks: Drinks
    private var chargedCoins: Int = 0
    private var purchaseHistory = [Drink]()
    
    init(drinks: Drinks) {
        self.drinks = drinks
    }
    
    mutating func charge(coins: Int) {
        chargedCoins += coins
    }
    
    mutating func addStock(for drink: Drink) {
        drinks.add(drink: drink)
    }
    
    mutating func getAvailableDrinks() -> [Drink] {
        return drinks.getAvailableDrinks(with: chargedCoins)
    }
    
    mutating func purchase(drink: Drink) {
        chargedCoins -= drink.price
        drinks.remove(drink: drink)
        purchaseHistory.append(drink)
    }
    
    mutating func checkRemainCoins() -> Int {
        return chargedCoins
    }
    
    mutating func getAllDrinks() -> [Drink: Int] {
        return drinks.getAllDrinks()
    }
    
    mutating func getExpiredDrinks() -> [Drink: Int] {
        return drinks.getExpiredDrinks()
    }
}
