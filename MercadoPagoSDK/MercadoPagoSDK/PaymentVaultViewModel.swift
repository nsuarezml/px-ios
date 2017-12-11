//
//  PaymentVaultViewModel.swift
//  MercadoPagoSDK
//
//  Created by Valeria Serber on 6/12/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation
class PaymentVaultViewModel: NSObject {

    var groupName: String?

    var amount: Double
    var paymentPreference: PaymentPreference?
    var email: String

    var paymentMethodOptions: [PaymentMethodOption]
    var customerPaymentOptions: [CardInformation]?
    var paymentMethodPlugins = [PXPaymentMethodPlugin]()
    var paymentMethods: [PaymentMethod]!
    var defaultPaymentOption: PaymentMethodSearchItem?
    // var cards : [Card]?

    var discount: DiscountCoupon?

    weak var controller: PaymentVaultViewController?

    var customerId: String?

    var callback : ((_ paymentMethod: PaymentMethod, _ token: Token?, _ issuer: Issuer?, _ payerCost: PayerCost?) -> Void)!
    var callbackCancel: (() -> Void)?
    var couponCallback: ((DiscountCoupon) -> Void)?
    var mercadoPagoServicesAdapter: MercadoPagoServicesAdapter!

    internal var isRoot = true

    init(amount: Double, paymentPrefence: PaymentPreference?, paymentMethodOptions: [PaymentMethodOption], customerPaymentOptions: [CardInformation]?, paymentMethodPlugins: [PXPaymentMethodPlugin], groupName: String? = nil, isRoot: Bool, discount: DiscountCoupon? = nil, email: String, mercadoPagoServicesAdapter: MercadoPagoServicesAdapter, callbackCancel: (() -> Void)? = nil, couponCallback: ((DiscountCoupon) -> Void)? = nil) {
        self.amount = amount
        self.email = email
        self.groupName = groupName
        self.discount = discount
        self.paymentPreference = paymentPrefence
        self.paymentMethodOptions = paymentMethodOptions
        self.customerPaymentOptions = customerPaymentOptions
        self.paymentMethodPlugins = paymentMethodPlugins
        self.isRoot = isRoot
        self.couponCallback = couponCallback
        self.mercadoPagoServicesAdapter = mercadoPagoServicesAdapter

    }

    func shouldGetCustomerCardsInfo() -> Bool {
        return MercadoPagoCheckoutViewModel.servicePreference.isCustomerInfoAvailable() && self.isRoot
    }

    func getCustomerPaymentMethodsToDisplayCount() -> Int {
        if !Array.isNullOrEmpty(customerPaymentOptions) && self.isRoot {
            let realCount = self.customerPaymentOptions!.count

            if MercadoPagoCheckoutViewModel.flowPreference.isShowAllSavedCardsEnabled() {
                return realCount
            } else {
                var maxChosenCount = MercadoPagoCheckoutViewModel.flowPreference.getMaxSavedCardsToShow()
                let hasAccountMoney = hasAccountMoneyIn(customerOptions: self.customerPaymentOptions!)
                if hasAccountMoney {
                    maxChosenCount += 1
                }
                return (realCount <= maxChosenCount ? realCount : maxChosenCount)
            }
        }
        return 0
    }

    func hasAccountMoneyIn(customerOptions: [CardInformation]) -> Bool {
        for paymentOption: CardInformation in customerOptions {
            if paymentOption.getPaymentMethodId() == PaymentTypeId.ACCOUNT_MONEY.rawValue {
                return true
            }
        }
        return false
    }

    func getPaymentMethodOption(row: Int) -> PaymentOptionDrawable {
        if hasPaymentMethodsPlugin() {
            if paymentMethodPlugins.indices.contains(row) {
                return paymentMethodPlugins[row]
            }
        }
        let indexInCustomerPaymentMethods = Array.isNullOrEmpty(self.paymentMethodPlugins) ? row : (row - self.paymentMethodPlugins.count)
        if self.getCustomerPaymentMethodsToDisplayCount() > indexInCustomerPaymentMethods {
            return self.customerPaymentOptions![indexInCustomerPaymentMethods]
        }
        let indexInPaymentMethods = Array.isNullOrEmpty(self.customerPaymentOptions) ? (row  - self.paymentMethodPlugins.count) : (row - self.getCustomerPaymentMethodsToDisplayCount() - self.paymentMethodPlugins.count)
        return self.paymentMethodOptions[indexInPaymentMethods] as! PaymentOptionDrawable
    }

    func getDisplayedPaymentMethodsCount() -> Int {
        let currentPaymentMethodSearchCount = self.paymentMethodOptions.count
        let paymentMethodPluginsCount = self.paymentMethodPlugins.count
        return self.getCustomerPaymentMethodsToDisplayCount() + currentPaymentMethodSearchCount + paymentMethodPluginsCount
    }

    func getExcludedPaymentTypeIds() -> Set<String>? {
        return (self.paymentPreference != nil) ? self.paymentPreference!.excludedPaymentTypeIds : nil
    }

    func getExcludedPaymentMethodIds() -> Set<String>? {
        return (self.paymentPreference != nil) ? self.paymentPreference!.excludedPaymentMethodIds : nil
    }

    func getPaymentPreferenceDefaultPaymentMethodId() -> String? {
        return (self.paymentPreference != nil) ? self.paymentPreference!.defaultPaymentMethodId : nil
    }

    func isCustomerPaymentMethodOptionSelected(_ row: Int) -> Bool {
        if Array.isNullOrEmpty(self.customerPaymentOptions) {
            return false
        }
        return (row < self.getCustomerPaymentMethodsToDisplayCount())
    }

    func hasOnlyGroupsPaymentMethodAvailable() -> Bool {
        return (self.paymentMethodOptions.count == 1 && Array.isNullOrEmpty(self.customerPaymentOptions))
    }

    func hasOnlyCustomerPaymentMethodAvailable() -> Bool {
        return Array.isNullOrEmpty(self.paymentMethodOptions) && !Array.isNullOrEmpty(self.customerPaymentOptions) && self.customerPaymentOptions?.count == 1
    }

    func hasPaymentMethodsPlugin() -> Bool {
        return !paymentMethodPlugins.isEmpty
    }

}
