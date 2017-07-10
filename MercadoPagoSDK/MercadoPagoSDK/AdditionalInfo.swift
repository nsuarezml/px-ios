//
//  AdditionalInfo.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 7/10/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

open class AdditionalInfo: NSObject {
    open var ipAddress: String?
    
    override public init() {
        super.init()
    }
    
    public init(ipAddress: String? = nil) {
        self.ipAddress = ipAddress
    }
    
    open class func fromJSON(_ json: NSDictionary) -> AdditionalInfo {
        let additionalInfo: AdditionalInfo = AdditionalInfo()
        if let ipAddress = JSONHandler.attemptParseToString(json["ip_address"]) {
            additionalInfo.ipAddress = ipAddress
        }
        return additionalInfo
    }
    
    open func toJSON() -> [String:Any] {
        var obj: [String:Any] = [:]
        if self.ipAddress != nil {
            obj["ip_address"] = self.ipAddress
        }
        return obj
    }
}

public func ==(obj1: AdditionalInfo, obj2: AdditionalInfo) -> Bool {
    let areEqual =
        obj1.ipAddress == obj2.ipAddress
    
    return areEqual
}
