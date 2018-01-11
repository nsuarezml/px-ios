//
//  PXThemeObjects.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 10/1/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit

class TitleCellScroll: UICollectionViewCell {}

class TitleCellTableScroll: UITableViewCell {}

class PXUpperView: UIView {}

class PXBarButton: UIBarButtonItem {}

class PXTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if self.font != nil {
            self.font = Utils.getFont(size: self.font!.pointSize)
            
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if self.font != nil {
            self.font = Utils.getFont(size: self.font!.pointSize)
            
        }
    }
}
