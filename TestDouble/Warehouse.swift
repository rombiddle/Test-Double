//
//  Warehouse.swift
//  TestDoubleTests
//
//  Created by Romain Brunie on 19/05/2021.
//

import Foundation

class Warehouse {
    var inventory = [String: Int]()
    
    func add(_ product: String, _ quantity: Int) {
        inventory[product] = quantity
    }
    
    func remove(_ product: String, _ quantity: Int) {
        inventory[product] = (inventory[product] ?? 0) - quantity
    }
    
    func hasInventory(_ product: String, _ quantity: Int) -> Bool {
        return inventory[product] ?? 0 >= quantity
    }
    
    func getInventory(_ product: String) -> Int {
        return inventory[product] ?? 0
    }
}
