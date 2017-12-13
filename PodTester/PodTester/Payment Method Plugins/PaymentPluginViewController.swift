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

    var pluginNaviagtionHandler: PXPluginNavigationHandler?

    //MARK: Lifecycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(PaymentPluginViewController.fakeFailurePaymentExample), with: nil, afterDelay: 2.0)
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
    
    func fakeFailurePaymentExample() {
        loadingView.stopAnimating()
        pluginNaviagtionHandler?.showFailure(message: "Opps, algo salio mal", errorDetails: "Verifique su conexión a internet", shouldRetry: true, callback: {
            self.loadingView.startAnimating()
            self.perform(#selector(PaymentPluginViewController.finishPaymentSuccessExample), with: nil, afterDelay: 4.0)
        })
    }
    
    func finishPaymentSuccessExample() {
        loadingView.stopAnimating()
        self.pluginNaviagtionHandler?.didFinishPayment(status: PaymentStatus.APPROVED , statusDetails: "", id: "123")
    }
}
