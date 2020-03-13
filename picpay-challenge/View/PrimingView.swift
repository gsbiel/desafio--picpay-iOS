//
//  PrimingView.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 09/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class PrimingView: UIView {
    
    lazy var creditCard: CreditCardView = {
        let card = CreditCardView(frame: CGRect(x: self.cardLeadingAnchorConstant, y: self.cardTopAnchorConstant, width: self.cardWidth, height: self.cardHeight))
        return card
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.mainLabelLeadingAnchorConstant, y: self.mainLabelTopAnchorConstant, width: self.mainLabelWidth, height: self.mainLabelHeight))
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = K.primingViewMainLabelText
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.secondaryLabelLeadingAnchorConstant, y: self.secondaryLabelTopAnchorConstant, width: self.secondaryLabelWidth, height: self.secondaryLabelHeight))
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = K.primingViewSecondaryLabelText
        return label
    }()
    
    lazy var registerCardButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.registerCardLeadingAnchorConstant, y: self.registerCardTopAnchorConstant, width: self.registerCardWidth, height: self.registerCardHeight))
        button.backgroundColor = MyUtilityFunctions.hexColor(hexString: "#11C76F")
        button.layer.cornerRadius = 40
        button.setAttributedTitle(NSAttributedString(string: "Cadastrar cartao", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = K.backGroundTheme
        self.addSubview(creditCard)
        self.addSubview(mainLabel)
        self.addSubview(secondaryLabel)
        self.addSubview(registerCardButton)
    }
    
}

//MARK: - Scaling factors for PrimingView UI Elements

extension PrimingView {
    
    // -----------------------------------------------------------------------------------------------
    // creditCard ------------------------------------------------------------------------------------
    
    private var cardWidthScaleFactor: CGFloat {
        return CGFloat(K.creditCardWidthRef / K.primingViewWidthRef)
    }
    
    private var cardHeightScaleFactor: CGFloat {
        return CGFloat(K.creditCardHeightRef / K.primingViewHeightRef)
    }
    
    private var cardTopAnchorScaleFactor: CGFloat {
        return CGFloat( K.creditCardTopAnchorConstantRef / K.primingViewHeightRef )
    }
    
    private var cardLeadingAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.creditCardLeadingAnchorConstantRef / K.primingViewWidthRef )
    }
    
    // -----------------------------------------------------------------------------------------------
    // mainLabel -------------------------------------------------------------------------------------
    
    private var mainLabelWidthScaleFactor: CGFloat {
        return CGFloat( K.primingViewMainLabelWidthRef / K.primingViewWidthRef)
    }
    
    private var mainLabelHeightScaleFactor: CGFloat {
        return CGFloat( K.primingViewMainLabelHeightRef / K.primingViewHeightRef)
    }
    
    private var mainLabelTopAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.primingViewMainLabelTopAnchorConstantRef / K.primingViewHeightRef)
    }
    
    private var mainLabelLeadingAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.primingViewMainLabelLeadingAnchorConstantRef / K.primingViewWidthRef)
    }
    
    // -----------------------------------------------------------------------------------------------
    // secondaryLabel --------------------------------------------------------------------------------
    
    private var secondaryLabelWidthScaleFactor: CGFloat {
        return CGFloat( K.primingViewSecondaryLabelWidthRef / K.primingViewWidthRef)
    }
    
    private var secondaryLabelHeightScaleFactor: CGFloat {
        return CGFloat( K.primingViewSecondaryLabelHeightRef / K.primingViewHeightRef)
    }
    
    private var secondaryLabelTopAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.primingViewSecondaryLabelTopAnchorConstantRef / K.primingViewHeightRef)
    }
    
    private var secondaryLabelLeadingAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.primingViewSecondaryLabelLeadingAnchorConstantRef / K.primingViewWidthRef)
    }
    
    // -----------------------------------------------------------------------------------------------
    // registerCardButton ----------------------------------------------------------------------------
    
    private var registerCardWidthScaleFactor: CGFloat {
        return CGFloat( K.primingViewRegisterCardWidthRef / K.primingViewWidthRef )
    }
    
    private var registerCardHeightScaleFactor: CGFloat {
        return CGFloat( K.primingViewRegisterCardHeightRef / K.primingViewHeightRef)
    }
    
    private var registerCardTopAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.primingViewRegisterCardTopAnchorConstantRef / K.primingViewHeightRef)
    }
    
    private var registerCardLeadingAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.primingViewRegisterCardLeadingAnchorConstantRef / K.primingViewWidthRef )
    }
    
}

//MARK: - Dimensions and constraint parameters for PrimingView UI elements

extension PrimingView {

    // -----------------------------------------------------------------------------------------------
    // creditCard ------------------------------------------------------------------------------------
    
    private var cardWidth: CGFloat {
        return self.cardWidthScaleFactor * UIScreen.main.bounds.width
    }
    
    private var cardHeight: CGFloat {
        return self.cardHeightScaleFactor * UIScreen.main.bounds.height
    }
    
    private var cardTopAnchorConstant: CGFloat {
        return self.cardTopAnchorScaleFactor * self.frame.height
    }
    
    private var cardLeadingAnchorConstant: CGFloat {
        return self.cardLeadingAnchorConstantScaleFactor * self.frame.width
    }

    // -----------------------------------------------------------------------------------------------
    // mainLabel -------------------------------------------------------------------------------------
    
    private var mainLabelWidth: CGFloat {
        return self.mainLabelWidthScaleFactor * self.frame.width
    }
    
    private var mainLabelHeight: CGFloat {
        return self.mainLabelHeightScaleFactor * self.frame.height
    }
    
    private var mainLabelTopAnchorConstant: CGFloat {
        return self.mainLabelTopAnchorConstantScaleFactor * self.frame.height
    }
    
    private var mainLabelLeadingAnchorConstant: CGFloat {
        return self.mainLabelLeadingAnchorConstantScaleFactor * self.frame.width
    }
    
    // -----------------------------------------------------------------------------------------------
    // secondaryLabel --------------------------------------------------------------------------------
    
    private var secondaryLabelWidth: CGFloat {
        return self.secondaryLabelWidthScaleFactor * self.frame.width
    }
    
    private var secondaryLabelHeight: CGFloat {
        return self.secondaryLabelHeightScaleFactor * self.frame.height
    }
    
    private var secondaryLabelTopAnchorConstant: CGFloat {
        return self.secondaryLabelTopAnchorConstantScaleFactor * self.frame.height
    }
    
    private var secondaryLabelLeadingAnchorConstant: CGFloat {
        return self.secondaryLabelLeadingAnchorConstantScaleFactor * self.frame.width
    }
    
    // -----------------------------------------------------------------------------------------------
    // registerCardButton ----------------------------------------------------------------------------
    
    private var registerCardWidth: CGFloat {
        return self.registerCardWidthScaleFactor * self.frame.width
    }
    
    private var registerCardHeight: CGFloat {
        return self.registerCardHeightScaleFactor * self.frame.height
    }
    
    private var registerCardTopAnchorConstant: CGFloat {
        return self.registerCardTopAnchorConstantScaleFactor * self.frame.height
    }
    
    private var registerCardLeadingAnchorConstant: CGFloat {
        return self.registerCardLeadingAnchorConstantScaleFactor * self.frame.width
    }
    
}

