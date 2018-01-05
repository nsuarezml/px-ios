//
//  PXPaymentMethodReviewRenderer.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 4/1/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit

class PXPaymentMethodReviewRenderer: NSObject {
    
    // Image
    let IMAGE_WIDTH: CGFloat = 48.0
    let IMAGE_HEIGHT: CGFloat = 48.0
    
    // Font styles
    let TITLE_FONT_SIZE: CGFloat = 21.0
    let DETAIL_FONT_SIZE: CGFloat = 16.0
    let PM_DETAIL_FONT_SIZE: CGFloat = 14.0
    let DISCLAIMER_FONT_SIZE: CGFloat = 12.0
    let ACTION_FONT_SIZE: CGFloat = 18.0
    let ACTION_LABEL_FONT_COLOR: UIColor = .primaryColor() //TODO: Replace by Theme. (MeliSkin)
    let ACTION_BUTTON_HEIGHT: CGFloat = 44
    let CONTENT_WIDTH_PERCENT: CGFloat = 86.0
    
    func render(component: PXPaymentMethodReviewComponent) -> PXPaymentMethodReviewView {
        
        let contentView = PXPaymentMethodReviewView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let paymentMethodIcon = component.getPaymentMethodIconComponent()
        contentView.paymentMethodIcon = paymentMethodIcon.render()
        contentView.paymentMethodIcon!.layer.cornerRadius = IMAGE_WIDTH/2
        contentView.addSubview(contentView.paymentMethodIcon!)
        PXLayout.centerHorizontally(view: contentView.paymentMethodIcon!).isActive = true
        PXLayout.setHeight(owner: contentView.paymentMethodIcon!, height: IMAGE_HEIGHT).isActive = true
        PXLayout.setWidth(owner: contentView.paymentMethodIcon!, width: IMAGE_WIDTH).isActive = true
        PXLayout.pinTop(view: contentView.paymentMethodIcon!, withMargin: PXLayout.L_MARGIN).isActive = true
        
        // Title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.title = title
        contentView.addSubview(title)
        title.text = component.props.title
        title.font = Utils.getFont(size: TITLE_FONT_SIZE)
        title.textColor = .pxBlack
        title.textAlignment = .center
        contentView.putOnBottomOfLastView(view: title, withMargin: PXLayout.S_MARGIN)?.isActive = true
        PXLayout.pinLeft(view: title, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.pinRight(view: title, withMargin: PXLayout.S_MARGIN).isActive = true
        
        if component.props.isOnlinePayment {
            // SubTitle
            if let subTitleText = component.props.subTitle {
                let subTitleLabel = UILabel()
                subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(subTitleLabel)
                contentView.subTitle = subTitleLabel
                subTitleLabel.text = subTitleText
                subTitleLabel.font = Utils.getFont(size: DETAIL_FONT_SIZE)
                subTitleLabel.textColor = .pxBrownishGray
                subTitleLabel.textAlignment = .center
                PXLayout.setHeight(owner: subTitleLabel, height: 18.0).isActive = true
                contentView.putOnBottomOfLastView(view: subTitleLabel, withMargin: PXLayout.XXS_MARGIN)?.isActive = true
                PXLayout.pinLeft(view: subTitleLabel, withMargin: PXLayout.XXS_MARGIN).isActive = true
                PXLayout.pinRight(view: subTitleLabel, withMargin: PXLayout.XXS_MARGIN).isActive = true
            }
            
            // Acreditation time info label.
            if let acreditationText = component.props.acreditationTime {
                let acreditationLabel = UILabel()
                acreditationLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.acreditationTime = acreditationLabel
                contentView.addSubview(acreditationLabel)
                acreditationLabel.text = acreditationText
                acreditationLabel.font = Utils.getFont(size: PM_DETAIL_FONT_SIZE)
                acreditationLabel.textColor = .pxBrownishGray
                acreditationLabel.textAlignment = .center
                contentView.putOnBottomOfLastView(view: acreditationLabel, withMargin: PXLayout.XXS_MARGIN)?.isActive = true
                PXLayout.pinLeft(view: acreditationLabel, withMargin:  PXLayout.XXS_MARGIN).isActive = true
                PXLayout.pinRight(view: acreditationLabel, withMargin:  PXLayout.XXS_MARGIN).isActive = true
            }
        }
        
        // Show change payment method button only for 2 or more payments options.
        if let paymentMethodsQty = component.props.paymentOptionsQuantity, paymentMethodsQty > 1 {
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Cambiar medio de pago".localized, for: .normal)
            button.titleLabel?.font = Utils.getFont(size: ACTION_FONT_SIZE)
            button.setTitleColor(ACTION_LABEL_FONT_COLOR, for: .normal)
        
            //button.add(for: .touchUpInside,)
            
            contentView.changePaymentButton = button
            
            contentView.addSubview(button)

            contentView.putOnBottomOfLastView(view: button, withMargin: PXLayout.M_MARGIN)?.isActive = true
            PXLayout.setHeight(owner: button, height: ACTION_BUTTON_HEIGHT).isActive = true
            PXLayout.matchWidth(ofView: button, toView: contentView, withPercentage: CONTENT_WIDTH_PERCENT).isActive = true
            PXLayout.centerHorizontally(view: button, to: contentView).isActive = true
        }
        
        return contentView
    }
}
