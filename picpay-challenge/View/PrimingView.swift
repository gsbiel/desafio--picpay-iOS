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
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        label.numberOfLines = 0
        label.textColor = .white
        //label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.96
        label.attributedText = NSMutableAttributedString(string: K.primingViewMainLabelText, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        
        return label
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

    }
    
}

//MARK: - Scaling factors for PrimingView

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
}

//MARK: - Dimensions and constraint parameters for PrimingView

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
    
}

