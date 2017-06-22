//
//  CardholderTest.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 1/3/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import XCTest

class CardholderTest: BaseTest {

    func testFromJSON() {
        let json: NSDictionary = MockManager.getMockFor("Cardholder")!
        let cardholderFromJSON = Cardholder.fromJSON(json)
        let cardHolder = MockBuilder.buildCardholder()
        cardHolder.identification = MockBuilder.buildIdentification()

        XCTAssertEqual(cardholderFromJSON.name, cardHolder.name)
        XCTAssertEqual(cardholderFromJSON.identification.type, cardHolder.identification.type)
        XCTAssertEqual(cardholderFromJSON.identification.number, cardHolder.identification.number)
    }
}
