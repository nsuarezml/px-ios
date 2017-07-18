//
//  SecrurityCodeViewController.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 11/3/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

open class SecurityCodeViewController: MercadoPagoUIViewController, UITextFieldDelegate {

    var securityCodeLabel: UILabel!
    @IBOutlet weak var securityCodeTextField: HoshiTextField!
    @IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var panelView: UIView!
    var viewModel: SecurityCodeViewModel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var cardCvvThumbnail: UIImageView!
    var textMaskFormater: TextMaskFormater!
    var cardFront: CardFrontView!
    var ccvLabelEmpty: Bool = true
    var toolbar: UIToolbar?

    override open var screenName: String { get { return "SECURITY_CODE" } }

    override open func viewDidLoad() {
        super.viewDidLoad()
         self.hideNavBar()
        loadMPStyles()
        self.errorLabel.alpha = 0
        self.securityCodeTextField.placeholder = "security_code".localized
        setupInputAccessoryView()
        self.errorLabel.text = "Revisa este dato".localized
        self.view.backgroundColor = UIColor.primaryColor()
        self.cardFront = CardFrontView.init(frame: viewModel.getCardBounds())
        self.view.addSubview(cardFront)
        self.securityCodeLabel = cardFront.cardCVV
        self.view.bringSubview(toFront: panelView)
        self.updateCardSkin(cardInformation: viewModel.cardInfo, paymentMethod: viewModel.paymentMethod)

        securityCodeTextField.autocorrectionType = UITextAutocorrectionType.no
        securityCodeTextField.keyboardType = UIKeyboardType.numberPad
        securityCodeTextField.addTarget(self, action: #selector(SecurityCodeViewController.editingChanged(_:)), for: UIControlEvents.editingChanged)
        securityCodeTextField.delegate = self
        completeCvvLabel()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public init(viewModel: SecurityCodeViewModel, collectSecurityCodeCallback: @escaping (_ cardInformation: CardInformationForm, _ securityCode: String) -> Void ) {
        super.init(nibName: "SecurityCodeViewController", bundle: MercadoPago.getBundle())
        self.viewModel = viewModel
        self.viewModel.callback = collectSecurityCodeCallback
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        securityCodeTextField.becomeFirstResponder()
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.showNavBar()
    }
    
    func setupInputAccessoryView() {
        let frame =  CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
        let toolbar = UIToolbar(frame: frame)
        
        toolbar.barStyle = UIBarStyle.default
        toolbar.backgroundColor = UIColor.mpLightGray()
        toolbar.alpha = 1
        toolbar.isUserInteractionEnabled = true
        
        let buttonNext = UIBarButtonItem(title: "Siguiente".localized, style: .done, target: self, action: #selector(self.continueAction))
        let buttonPrev = UIBarButtonItem(title: "Anterior".localized, style: .plain, target: self, action: #selector(self.backAction))
        
        let font = Utils.getFont(size: 14)
        buttonNext.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        buttonPrev.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        
        buttonNext.setTitlePositionAdjustment(UIOffset(horizontal: UIScreen.main.bounds.size.width / 8, vertical: 0), for: UIBarMetrics.default)
        buttonPrev.setTitlePositionAdjustment(UIOffset(horizontal: -UIScreen.main.bounds.size.width / 8, vertical: 0), for: UIBarMetrics.default)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [flexibleSpace, buttonPrev, flexibleSpace, buttonNext, flexibleSpace]
        
        self.toolbar = toolbar
        self.securityCodeTextField.delegate = self
        self.securityCodeTextField.inputAccessoryView = toolbar
    }
    
    func continueAction(){
        securityCodeTextField.resignFirstResponder()
        guard securityCodeTextField.text?.characters.count == viewModel.secCodeLenght() else {
            showErrorMessage()
            return
        }
        self.viewModel.executeCallback(secCode:  securityCodeTextField.text)
    }
    
    func backAction(){
        self.executeBack()
    }

    func updateCardSkin(cardInformation: CardInformationForm?, paymentMethod: PaymentMethod) {
        self.updateCardThumbnail(paymentMethodColor: paymentMethod.getColor(bin: cardInformation?.getCardBin()))
        self.cardFront.updateCard(token: cardInformation, paymentMethod: paymentMethod)
        cardFront.cardCVV.alpha = 0.8
        cardFront.setCornerRadius(radius: 11)
    }
    
    func updateCardThumbnail(paymentMethodColor: UIColor) {
        self.cardCvvThumbnail.backgroundColor = paymentMethodColor
        self.cardCvvThumbnail.layer.cornerRadius = 3
        if self.viewModel.secCodeInBack() {
            self.securityCodeLabel.isHidden = true
            self.cardCvvThumbnail.image = MercadoPago.getImage("CardCVVThumbnailBack")
        } else {
            self.securityCodeLabel.isHidden = false
            self.cardCvvThumbnail.image = MercadoPago.getImage("CardCVVThumbnailFront")
        }
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if ((textField.text?.characters.count)! + string.characters.count) > viewModel.secCodeLenght() {
            return false
        }
        return true
    }

    open func editingChanged(_ textField: UITextField) {
        hideErrorMessage()
        securityCodeLabel.text = textField.text
        self.ccvLabelEmpty = (textField.text != nil && textField.text!.characters.count == 0)
        securityCodeLabel.textColor = self.viewModel.getPaymentMethodFontColor()
        completeCvvLabel()

    }

    open func showErrorMessage() {
        self.errorLabel.alpha = 1
    }
    open func hideErrorMessage() {
        self.errorLabel.alpha = 0
    }

    func completeCvvLabel() {
        if self.ccvLabelEmpty {
            securityCodeLabel!.text = ""
        }

        while addCvvDot() != false {

        }
        securityCodeLabel.textColor = self.viewModel.getPaymentMethodFontColor()
    }

    func addCvvDot() -> Bool {

        let label = self.securityCodeLabel
        //Check for max length including the spacers we added
        if label?.text?.characters.count == self.viewModel.secCodeLenght() {
            return false
        }

        label?.text?.append("•")
        return true
    }
}
