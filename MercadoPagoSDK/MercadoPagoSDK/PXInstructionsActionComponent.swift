//
//  PXInstructionsActionComponent.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 11/16/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

class PXInstructionsActionComponent: NSObject, PXComponetizable {
    var props: PXInstructionsActionProps

    init(props: PXInstructionsActionProps) {
        self.props = props
    }
    func render() -> UIView {
        return PXInstructionsActionRenderer().render(self)
    }
}
class PXInstructionsActionProps: NSObject {
    var instructionActionInfo: InstructionAction?
    init(instructionActionInfo: InstructionAction?) {
        self.instructionActionInfo = instructionActionInfo
    }
}