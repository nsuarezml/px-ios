//
//  MerchantServerTest.swift
//  MercadoPagoSDK
//
//  Created by Mauro Reverter on 6/14/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation
import XCTest

class MerchantServerTest: BaseTest {
    override func setUp() {
        super.setUp()
    }
    func testWhenPaymentsResponseStatusIsProcessingThenMapResponseToPaymentInProcess() {
        let payerDict: NSMutableDictionary = NSMutableDictionary()
        payerDict.setValue("android-was-here@gmail.com", forKey: "email")
        let paymentBodyDict: NSMutableDictionary = NSMutableDictionary()
        paymentBodyDict.setValue(payerDict, forKey: "payer")
        MerchantServer.createPayment(paymentUrl: "http://api.mercadopago.com", paymentUri: "/v1/checkout/payments?public_key=PK-PROCESSING-TEST&payment_method_id=visa", paymentBody: paymentBodyDict, success: { (payment: Payment) -> Void in
            XCTAssertEqual(payment.status, PaymentStatus.IN_PROCESS.rawValue)
        }, failure: { (_: NSError) -> Void in
            XCTFail()
        })
    }
}
