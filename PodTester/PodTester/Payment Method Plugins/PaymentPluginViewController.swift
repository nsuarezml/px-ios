//
//  PaymentPluginViewController.swift
//  PodTester
//
//  Created by Eden Torres on 12/11/17.
//  Copyright © 2017 AUGUSTO COLLERONE ALFONSO. All rights reserved.
//

import UIKit
import MercadoPagoSDK

class PaymentPluginViewController: UIViewController {

    //MARK: Outlets.
    @IBOutlet weak var loadingView: UIActivityIndicatorView!

    //MARK: Lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(PaymentPluginViewController.finishPayment), with: nil, afterDelay: 4.0)
    }

}

//MARK: Plugin implementation.
extension PaymentPluginViewController: PXPluginComponent {
    func render() -> UIView {
        return self.view
    }
}

//MARK: Actions.
extension PaymentPluginViewController {
    func finishPayment() {
        loadingView.stopAnimating()
        //TODO: Execute success.
    }
}
