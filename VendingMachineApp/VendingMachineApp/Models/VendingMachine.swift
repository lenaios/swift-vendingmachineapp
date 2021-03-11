//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    private var standardHotTempertaure = 70
    private var drinks: Drinks
    private var chargedCoins: Int = 0
    private var purchaseHistory: PurchaseHistory
    override var description: String {
        return "\(drinks)"
    }
    
    init(drinks: Drinks) {
        self.drinks = drinks
        self.purchaseHistory = PurchaseHistory()
    }
    
    required init?(coder: NSCoder) {
        self.standardHotTempertaure = coder.decodeInteger(forKey: "standardHotTempertaure")
        self.drinks = coder.decodeObject(forKey: "drinks") as! Drinks
        self.chargedCoins = coder.decodeInteger(forKey: "chargedCoins")
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as! PurchaseHistory
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(standardHotTempertaure, forKey: "standardHotTempertaure")
        coder.encode(drinks, forKey: "drinks")
        coder.encode(chargedCoins, forKey: "chargedCoins")
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
    }
    
    func charge(coins: Int) {
        chargedCoins += coins
    }
    
    func addStock(for drink: Drink) {
        drinks.add(drink: drink)
    }
    
    func getAvailableDrinks() -> [Drink] {
        return drinks.getAvailableDrinks(with: chargedCoins)
    }
    
    func purchase(drink: Drink) {
        chargedCoins -= drink.price
        drinks.remove(drink: drink)
        purchaseHistory.add(drink: drink)
    }
    
    func checkRemainCoins() -> Int {
        return chargedCoins
    }
    
    func getAllDrinks() -> [ObjectIdentifier: [Drink]] {
        return drinks.getAllDrinks()
    }
    
    func getExpiredDrinks(date: Date) -> [Drink] {
        return drinks.getExpiredDrinks(date: date)
    }
    
    func getHotDrinks() -> [Drink] {
        return drinks.getHotDrinks(for: standardHotTempertaure)
    }
    
    func getPurchaseHistory() -> [Drink] {
        return purchaseHistory.purchasedDrinks
    }
}
