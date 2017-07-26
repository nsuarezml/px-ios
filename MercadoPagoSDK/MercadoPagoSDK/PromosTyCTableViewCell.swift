//
//  PromosTyCTableViewCell.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 22/5/15.
//  Copyright (c) 2015 MercadoPago. All rights reserved.
//

import UIKit

open class PromosTyCTableViewCell: UITableViewCell {

	@IBOutlet weak fileprivate var title: MPLabel!

    override open func awakeFromNib() {
        super.awakeFromNib()
		self.title.text = LocalizableStringsUtil.TERMINOS_Y_CONDICIONES
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
