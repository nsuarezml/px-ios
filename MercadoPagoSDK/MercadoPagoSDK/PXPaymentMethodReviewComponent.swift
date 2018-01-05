//
//  PXPaymentMethodReviewComponent.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 4/1/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit

public class PXPaymentMethodReviewComponent: NSObject, PXComponentizable {
    
    var props: PXPaymentMethodReviewProps
    
    init(props: PXPaymentMethodReviewProps) {
        self.props = props
    }
    
    func getPaymentMethodIconComponent() -> PXPaymentMethodIconComponent {
        let paymentMethodIconProps = PXPaymentMethodIconProps(paymentMethodIcon: self.props.paymentMethodIcon)
        let paymentMethodIconComponent = PXPaymentMethodIconComponent(props: paymentMethodIconProps)
        return paymentMethodIconComponent
    }
    
    public func render() -> UIView {
        return PXPaymentMethodReviewRenderer().render(component: self)
    }
}

class PXPaymentMethodReviewProps: NSObject {
    var paymentMethodIcon: UIImage?
    var amountTitle: String
    var amountDetail: String?
    var paymentMethodDescription: String?
    var paymentMethodDetail: String?
    var disclaimer: String?
    
    init(paymentMethodIcon: UIImage?, amountTitle: String, amountDetail: String?, paymentMethodDescription: String?, paymentMethodDetail: String?, disclaimer: String?) {
        self.paymentMethodIcon = paymentMethodIcon
        self.amountTitle = amountTitle
        self.amountDetail = amountDetail
        self.paymentMethodDescription = paymentMethodDescription
        self.paymentMethodDetail = paymentMethodDetail
        self.disclaimer = disclaimer
    }
}
