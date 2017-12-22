//
//  LoadingOverlay.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 29/4/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

open class LoadingOverlay {

    var container = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var loadingContainer: MPSDKLoadingView!
    var screenContainer = UIView()

    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }

    open func showOverlay(_ view: UIView, backgroundColor: UIColor, indicatorColor: UIColor = UIColor.px_white()) -> UIView {

        loadingContainer = MPSDKLoadingView(loading: UIColor.primaryColor())!
        
        view.addSubview(loadingContainer)
        view.bringSubview(toFront: loadingContainer)
    
        return loadingContainer
    }

    open func hideOverlayView() {
        if self.loadingContainer != nil {
            self.loadingContainer.removeFromSuperview()
        }
    }
}
