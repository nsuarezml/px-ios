//
//  PXReviewViewController.swift
//  MercadoPagoSDK
//
//  Created by Juan Sebastian Sanzone on 5/1/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit
import MercadoPagoPXTracking

class PXReviewViewController: PXComponentContainerViewController {
    
    //MARK: Tracking
    override open var screenName: String { get { return TrackingUtil.SCREEN_NAME_REVIEW_AND_CONFIRM } }
    override open var screenId: String { get { return TrackingUtil.SCREEN_ID_REVIEW_AND_CONFIRM } }
    
    //MARK: Definitions
    fileprivate var viewModel: CheckoutViewModel!
    
    //MARK: ComponentViews
    var paymentMethodView:UIView!
    
    //MARK: Lifecycle - Publics
    init(viewModel: CheckoutViewModel) {
        super.init()
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
        setupUI()
    }
    
    func update(viewModel:CheckoutViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: UI Methods
extension PXReviewViewController {
    
    fileprivate func setupUI() {
        renderViews()
        scrollView.backgroundColor = .white
        setNavBarBackgroundColor(color: .white)
        navBarTextColor = .primaryColor() // TODO: Replace with Theme.
    }
    
    fileprivate func renderViews() {
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
        for constraint in contentView.constraints {
            constraint.isActive = false
        }
        
        // Renderize component views.
        renderPaymentMethodView()
    }
    
    fileprivate func renderPaymentMethodView() {
        paymentMethodView = buildPaymentMethodComponent().render()
        contentView.addSubview(paymentMethodView)
        PXLayout.pinTop(view: paymentMethodView, to: contentView).isActive = true
        PXLayout.centerHorizontally(view: paymentMethodView).isActive = true
    }
}

// MARK: Comonents builders.
extension PXReviewViewController {
    
    fileprivate func buildPaymentMethodComponent() -> PXPaymentMethodReviewComponent {
        let paymentMethodProps = PXPaymentMethodReviewProps(paymentMethodIcon: viewModel.paymentData.getPaymentMethod()?.getImage(), title: self.viewModel.paymentData.getPaymentMethod()?.name, subTitle:self.viewModel.paymentOptionSelected.getDescription(), acreditationTime:"TODO_ACREDITATION_TIME", isOnlinePayment:self.viewModel.paymentData.getPaymentMethod()?.isOnlinePaymentMethod, paymentOptionsQty: self.viewModel.paymentOptionsQuantity)
        return PXPaymentMethodReviewComponent(props: paymentMethodProps)
    }
}
