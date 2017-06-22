//
//  PaymentTest.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 1/3/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import XCTest

class PaymentTest: BaseTest {

    func testFromJSON() {
        let json: NSDictionary = MockManager.getMockFor("Payment")!
        let paymentFromJSON = Payment.fromJSON(json)
        XCTAssertEqual(paymentFromJSON._id, "123123124235")
        XCTAssertEqual(paymentFromJSON.currencyId, "currency_id")
        XCTAssertEqual(paymentFromJSON.card.idCard, "123456")
        XCTAssertEqual(paymentFromJSON.card.lastFourDigits, "4444")
        XCTAssertEqual(paymentFromJSON.card.customerId, "customer_id")
        XCTAssertEqual(paymentFromJSON.card.firstSixDigits, "451234")
        XCTAssertEqual(paymentFromJSON.paymentMethodId, "payment_method_id")
        XCTAssertEqual(paymentFromJSON.paymentTypeId, "payment_type_id")
        XCTAssertEqual(paymentFromJSON.payer.email, "email")
        XCTAssertEqual(paymentFromJSON.status, "status")
        XCTAssertEqual(paymentFromJSON.statusDetail, "status_detail")
    }

}
