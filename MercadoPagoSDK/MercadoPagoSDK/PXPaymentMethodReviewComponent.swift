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
    var title: String?
    var subTitle: String?
    var acreditationTime: String?
    var paymentOptionsQuantity: Int?
    var isOnlinePayment: Bool = true
    
    init(paymentMethodIcon: UIImage?, title: String?, subTitle: String?, acreditationTime: String?, isOnlinePayment:Bool?, paymentOptionsQty: Int?) {
        self.paymentMethodIcon = paymentMethodIcon
        self.title = title
        self.subTitle = subTitle
        self.acreditationTime = acreditationTime
        self.paymentOptionsQuantity = paymentOptionsQty
        if let isOnline = isOnlinePayment {
            self.isOnlinePayment = isOnline
        }
    }
}
