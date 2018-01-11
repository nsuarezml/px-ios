//
//  MeliTheme.swift
//  MercadoPagoSDKExamplesObjectiveC
//
//  Created by Juan sebastian Sanzone on 10/1/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit
import MercadoPagoSDK

@objc public class MeliTheme: NSObject, PXTheme {
    
    public func navigationBar() -> PXThemeProperty {
        return PXThemeProperty(backgroundColor: #colorLiteral(red: 0.9960784314, green: 0.862745098, blue: 0.07450980392, alpha: 1), tintColor: #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1))
    }
    
    public func primaryButton() -> PXThemeProperty {
        return PXThemeProperty(backgroundColor: #colorLiteral(red: 0.2039215686, green: 0.5137254902, blue: 0.9803921569, alpha: 1), tintColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    public func secondaryButton() -> PXThemeProperty {
        return PXThemeProperty(backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), tintColor: #colorLiteral(red: 0.2039215686, green: 0.5137254902, blue: 0.9803921569, alpha: 1))
    }
    
    public func titleTintColor() -> UIColor {
        return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    public func subTitleTintColor() -> UIColor {
        return #colorLiteral(red: 0.2039215686, green: 0.5137254902, blue: 0.9803921569, alpha: 1)
    }
    
    public func successColor() -> UIColor {
        return #colorLiteral(red: 0.3921568627, green: 0.7725490196, blue: 0.4549019608, alpha: 1)
    }
    
    public func warningColor() -> UIColor {
        return #colorLiteral(red: 0.9843137255, green: 0.6705882353, blue: 0.3764705882, alpha: 1)
    }
    
    public func rejectedColor() -> UIColor {
        return #colorLiteral(red: 0.9764705882, green: 0.3764705882, blue: 0.3803921569, alpha: 1)
    }
    
    public func statusBarStyle() -> UIStatusBarStyle {
        return .default
    }
}
