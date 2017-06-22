//
//  CardTest.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 3/3/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import XCTest

class CardTest: BaseTest {

    func testFromJSON() {
        var json: NSDictionary = MockManager.getMockFor("Card")!
        var cardFromJSON = Card.fromJSON(json)
        let card = MockBuilder.buildCard(paymentMethodId: "id")
        card.cardHolder?.identification = MockBuilder.buildIdentification()
        XCTAssertEqual(cardFromJSON.idCard, card.idCard)
        XCTAssertEqual(cardFromJSON.dateCreated, card.dateCreated)
        XCTAssertEqual(cardFromJSON.dateLastUpdated, card.dateLastUpdated)
        XCTAssertEqual(cardFromJSON.expirationMonth, card.expirationMonth)
        XCTAssertEqual(cardFromJSON.expirationYear, card.expirationYear)
        XCTAssertEqual(cardFromJSON.customerId, card.customerId)
        XCTAssertEqual(cardFromJSON.firstSixDigits, card.firstSixDigits)
        XCTAssertEqual(cardFromJSON.lastFourDigits, card.lastFourDigits)

        XCTAssertEqual(cardFromJSON.cardHolder!.name!, card.cardHolder!.name!)
        XCTAssertEqual(cardFromJSON.cardHolder!.identification.number!, card.cardHolder!.identification.number!)

        XCTAssertEqual(cardFromJSON.paymentMethod!._id!, card.paymentMethod!._id!)

        XCTAssertEqual(cardFromJSON.issuer!._id!, card.issuer!._id!)

        XCTAssertEqual(cardFromJSON.securityCode!.length, card.securityCode!.length)

        // Convert to String and to Dictionary again
        let cardJson = cardFromJSON.toJSONString()
        json = MockManager.getDictionaryFor(string: cardJson)!
        cardFromJSON = Card.fromJSON(json)

        XCTAssertEqual(cardFromJSON.idCard, card.idCard)
        XCTAssertEqual(cardFromJSON.dateCreated, card.dateCreated)
        XCTAssertEqual(cardFromJSON.dateLastUpdated, card.dateLastUpdated)
        XCTAssertEqual(cardFromJSON.expirationMonth, card.expirationMonth)
        XCTAssertEqual(cardFromJSON.expirationYear, card.expirationYear)
        XCTAssertEqual(cardFromJSON.customerId, card.customerId)
        XCTAssertEqual(cardFromJSON.firstSixDigits, card.firstSixDigits)
        XCTAssertEqual(cardFromJSON.lastFourDigits, card.lastFourDigits)

        XCTAssertEqual(cardFromJSON.cardHolder!.name!, card.cardHolder!.name!)
        XCTAssertEqual(cardFromJSON.cardHolder!.identification.number!, card.cardHolder!.identification.number!)

        XCTAssertEqual(cardFromJSON.paymentMethod!._id!, card.paymentMethod!._id!)

        XCTAssertEqual(cardFromJSON.issuer!._id!, card.issuer!._id!)

        XCTAssertEqual(cardFromJSON.securityCode!.length, card.securityCode!.length)
    }

}
