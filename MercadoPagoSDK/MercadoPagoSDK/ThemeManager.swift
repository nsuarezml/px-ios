//
//  ThemeManager.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 10/1/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

class ThemeManager {
    fileprivate var currentTheme: PXTheme = PXDefaultTheme() {
        didSet {
            initialize()
        }
    }
    static let shared = ThemeManager()
}

//MARK: - Public methods
extension ThemeManager {
    
    func initialize() {
        customizeButtons(theme: currentTheme)
        navigationBar(theme: currentTheme)
    }
    
    func setDefaultColor(color: UIColor) {
        let customTheme = PXDefaultTheme(withPrimaryColor: color)
        self.currentTheme = customTheme
    }
        
    func setTheme(theme: PXTheme?) {
        if let currentTheme = theme {
            self.currentTheme = currentTheme
        }
    }
}

//MARK: - UI Theme customization
extension ThemeManager {
    fileprivate func customizeButtons(theme: PXTheme) {
        
    }
    
    fileprivate func navigationBar(theme: PXTheme) {
        
        
        TitleCellScroll.appearance().backgroundColor = theme.navigationBar().backgroundColor
        TitleCellTableScroll.appearance().backgroundColor = theme.navigationBar().backgroundColor
        PXUpperView.appearance().backgroundColor = theme.navigationBar().backgroundColor
        PXTitleLabel.appearance().textColor = theme.navigationBar().tintColor
        UINavigationBar.appearance().tintColor = theme.navigationBar().tintColor
        UINavigationBar.appearance().backgroundColor = theme.navigationBar().backgroundColor
        PXBarButton.appearance().image = MercadoPago.getImage("back")
        PXBarButton.appearance().style = .plain
        PXBarButton.appearance().tintColor = theme.navigationBar().tintColor
        
        
        // Cross backgrounds (Collections, Tables, Scrolls)
        UICollectionView.appearance(whenContainedInInstancesOf: [MercadoPagoUIViewController.self]).backgroundColor = .white
        UITableView.appearance(whenContainedInInstancesOf: [MercadoPagoUIViewController.self]).backgroundColor = .white
        UIScrollView.appearance(whenContainedInInstancesOf: [MercadoPagoUIViewController.self]).backgroundColor = .white
    }
}
