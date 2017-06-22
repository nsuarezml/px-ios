//
//  CustomerTest.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 1/3/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import XCTest

class CustomerTest: BaseTest {

    func testFromJSON() {
        var json: NSDictionary = MockManager.getMockFor("Customer")!
        var customerFromJSON = Customer.fromJSON(json)
        let customer = MockBuilder.buildCustomer()

        XCTAssertEqual(customerFromJSON.cards![0].idCard, customer.cards![0].idCard)
        XCTAssertEqual(customerFromJSON.cards![0].paymentMethod!._id!, customer.cards![0].paymentMethod!._id!)
        XCTAssertEqual(customerFromJSON.defaultCard!, customer.defaultCard!)
        XCTAssertEqual(customerFromJSON._description!, customer._description!)
        XCTAssertEqual(customerFromJSON.dateCreated, customer.dateCreated)
        XCTAssertEqual(customerFromJSON.dateLastUpdated, customer.dateLastUpdated)
        XCTAssertEqual(customerFromJSON.email!, customer.email!)
        XCTAssertEqual(customerFromJSON.firstName!, customer.firstName!)
        XCTAssertEqual(customerFromJSON.lastName!, customer.lastName!)
        XCTAssertEqual(customerFromJSON._id!, customer._id!)
        XCTAssertEqual(customerFromJSON.liveMode!, customer.liveMode!)

        XCTAssertEqual(customerFromJSON.identification!.number!, customer.identification!.number!)

        XCTAssertEqual(customerFromJSON.address!.streetName!, customer.address!.streetName!)

        // Convert to String and to Dictionary again
        let customerJson = customerFromJSON.toJSONString()
        json = MockManager.getDictionaryFor(string: customerJson)!
        customerFromJSON = Customer.fromJSON(json)

        XCTAssertEqual(customerFromJSON.cards![0].idCard, customer.cards![0].idCard)
        XCTAssertEqual(customerFromJSON.cards![0].paymentMethod!._id!, customer.cards![0].paymentMethod!._id!)
        XCTAssertEqual(customerFromJSON.defaultCard!, customer.defaultCard!)
        XCTAssertEqual(customerFromJSON._description!, customer._description!)
        XCTAssertEqual(customerFromJSON.dateCreated, customer.dateCreated)
        XCTAssertEqual(customerFromJSON.dateLastUpdated, customer.dateLastUpdated)
        XCTAssertEqual(customerFromJSON.email!, customer.email!)
        XCTAssertEqual(customerFromJSON.firstName!, customer.firstName!)
        XCTAssertEqual(customerFromJSON.lastName!, customer.lastName!)
        XCTAssertEqual(customerFromJSON._id!, customer._id!)
        XCTAssertEqual(customerFromJSON.liveMode!, customer.liveMode!)

        XCTAssertEqual(customerFromJSON.identification!.number!, customer.identification!.number!)

        XCTAssertEqual(customerFromJSON.address!.streetName!, customer.address!.streetName!)
    }

    func testFromJSONNoCards() {
        var json: NSDictionary = MockManager.getMockFor("Customer")!
        var customerFromJSON = Customer.fromJSON(json)
        customerFromJSON.cards = nil
        let customer = MockBuilder.buildCustomer()

        // Convert to String and to Dictionary again
        let customerJson = customerFromJSON.toJSONString()
        json = MockManager.getDictionaryFor(string: customerJson)!
        customerFromJSON = Customer.fromJSON(json)

        XCTAssertNil(customerFromJSON.cards)
        XCTAssertEqual(customerFromJSON.defaultCard!, customer.defaultCard!)
        XCTAssertEqual(customerFromJSON._description!, customer._description!)
        XCTAssertEqual(customerFromJSON.dateCreated, customer.dateCreated)
        XCTAssertEqual(customerFromJSON.dateLastUpdated, customer.dateLastUpdated)
        XCTAssertEqual(customerFromJSON.email!, customer.email!)
        XCTAssertEqual(customerFromJSON.firstName!, customer.firstName!)
        XCTAssertEqual(customerFromJSON.lastName!, customer.lastName!)
        XCTAssertEqual(customerFromJSON._id!, customer._id!)
        XCTAssertEqual(customerFromJSON.liveMode!, customer.liveMode!)

        XCTAssertEqual(customerFromJSON.identification!.number!, customer.identification!.number!)

        XCTAssertEqual(customerFromJSON.address!.streetName!, customer.address!.streetName!)
    }
}
