//
//  MPXLoadingViewController.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 2/16/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

class MPXLoadingViewController: MercadoPagoUIViewController {

    override func viewDidLoad() {
        view.backgroundColor = MercadoPagoCheckoutViewModel.decorationPreference.baseColor
    }
    
    func getInstance() ->  UIView {
        return LoadingOverlay.shared.showOverlay(view, backgroundColor: MercadoPagoCheckoutViewModel.decorationPreference.baseColor)
    }
}
