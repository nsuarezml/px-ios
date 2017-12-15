//
//  PXPluginNavigationHandler.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 12/14/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation
open class PXPluginNavigationHandler: NSObject {

    private var checkout: MercadoPagoCheckout?

    public init(withCheckout: MercadoPagoCheckout) {
        self.checkout = withCheckout
    }

    open func didFinishPayment(paymentStatus: PXPaymentMethodPlugin.RemotePaymentStatus, statusDetails: String, receiptId: String?) {

        guard let paymentData = self.checkout?.viewModel.paymentData else {
            return
        }

        // Set paymentPlugin image into payment method.
        if let paymentMethodPlugin = self.checkout?.viewModel.paymentOptionSelected as? PXPaymentMethodPlugin {
            paymentData.paymentMethod?.setExternalPaymentMethodImage(externalImage: paymentMethodPlugin.getImage())
        }
        
        // By definition of MVP1, we support only approved or rejected.
        var paymentStatusStrDefault = PaymentStatus.REJECTED
        if paymentStatus == .APPROVED {
            paymentStatusStrDefault = PaymentStatus.APPROVED
        }

        let paymentResult = PaymentResult(status: paymentStatusStrDefault, statusDetail: statusDetails, paymentData: paymentData, payerEmail: nil, id: receiptId, statementDescription: nil)

        checkout?.setPaymentResult(paymentResult: paymentResult)
        checkout?.executeNextStep()
    }

    open func showFailure(message: String, errorDetails: String, shouldRetry: Bool, callback: (() -> Void)?) {
        MercadoPagoCheckoutViewModel.error = MPSDKError(message: message, errorDetail: errorDetails, retry: shouldRetry)
        checkout?.viewModel.errorCallback = callback
        checkout?.executeNextStep()
    }

    open func next() {
        checkout?.executeNextStep()
    }

    open func cancel() {
        checkout?.cancel()
    }

    open func showLoading() {
        checkout?.presentLoading()
    }

    open func hideLoading() {
        checkout?.dismissLoading()
    }
}
