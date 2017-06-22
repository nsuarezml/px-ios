//
//  SecurityCodeTest.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 1/3/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import XCTest

class SecurityCodeTest: BaseTest {

    func testFromJSON() {
        let json: NSDictionary = MockManager.getMockFor("SecurityCode")!
        let securityCodeFromJSON = SecurityCode.fromJSON(json)
        let securityCode = MockBuilder.buildSecurityCode()

        XCTAssertEqual(securityCodeFromJSON.cardLocation, securityCode.cardLocation)
        XCTAssertEqual(securityCodeFromJSON.length, securityCode.length)
        XCTAssertEqual(securityCodeFromJSON.mode, securityCode.mode)
    }

}
