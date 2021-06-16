//
//  TestDoubleTests.swift
//  TestDoubleTests
//
//  Created by Romain Brunie on 19/05/2021.
//

import XCTest
@testable import TestDouble

class OrderStateTester: XCTestCase {
    let talisker = "Talisker"
    let highlandPark = "Highland Park"
    let warehouse = Warehouse()
    
    override func setUp() {
        warehouse.add(talisker, 50)
        warehouse.add(highlandPark, 25)
    }

    func testOrderIsFilledIfEnoughInWarehouse() {
        let order = Order(talisker, 50)
        order.fill(warehouse)
        
        XCTAssertTrue(order.isFilled())
        XCTAssertEqual(0, warehouse.getInventory(talisker))
    }
    
    func testOrderDoesNotRemoveIfNotEnough() {
        let order = Order(talisker, 51)
        order.fill(warehouse)
        
        XCTAssertFalse(order.isFilled())
        XCTAssertEqual(50, warehouse.getInventory(talisker))
    }
    
    // MARK: - Mock
    
    private class MailServiceMock: MailService {
        var sendCallCount = 0
        
        func send(_ message: String) {
            sendCallCount += 1
        }
    }
    
    private class WarehouseMock: Warehouse {
        var hasInventoryMessage = [Bool]()
        
        override func hasInventory(_ product: String, _ quantity: Int) -> Bool {
            let result = super.hasInventory(product, quantity)
            hasInventoryMessage.append(result)
            return result
        }
    }
    
    func testOrderSendsMailIfUnfilledWithMock() throws {
        let order = Order(talisker, 51)
        let mailer = MailServiceMock()
        let warehouse = WarehouseMock()
        order.setMailer(mailer)

        order.fill(warehouse)

        XCTAssertEqual(1, mailer.sendCallCount)
        XCTAssertEqual(1, warehouse.hasInventoryMessage.count)
        let hasInventory = try XCTUnwrap(warehouse.hasInventoryMessage.first)
        XCTAssertFalse(hasInventory)
    }

}
