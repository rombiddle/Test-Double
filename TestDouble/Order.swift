//
//  Order.swift
//  TestDouble
//
//  Created by Romain Brunie on 19/05/2021.
//

import Foundation

class Order {
    var product: String
    var quantity: Int
    var isOrderFilled: Bool = false
    var mailer: MailService?
    
    init(_ product: String, _ quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
    
    func fill(_ warehouse: Warehouse) {
        if warehouse.hasInventory(product, quantity) {
            warehouse.remove(product, quantity)
            isOrderFilled = true
        } else {
            mailer?.send("")
        }
    }
    
    func isFilled() -> Bool {
        return isOrderFilled
    }
    
    func setMailer(_ mailer: MailService) {
        self.mailer = mailer
    }
}
