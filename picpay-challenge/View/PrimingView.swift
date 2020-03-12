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
        // Tive que ja passar o frame da CreditCardView, pois a CAGradientLayer presente nesse componente precisa das dimensoes no momento que for inicializada, uma vez que nao e possivel configurar sublayers com autolayout.
        let card = CreditCardView(frame: CGRect(x: self.cardLeadingAnchorConstant, y: self.cardTopAnchorConstant, width: self.cardWidth, height: self.cardHeight))
        //card.translatesAutoresizingMaskIntoConstraints = false
        return card
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
//        self.layer.addSublayer(gradientLayer)
        self.addSubview(creditCard)
        //setupLayout()
    }
    
//    private func setupLayout() {
//
//        // creditCard constraints
//        creditCard.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -1 * cardWidth / 2.0).isActive = true
//        creditCard.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:  -1 * cardHeight / 2.0).isActive = true
//    }
    
}

//MARK: - Scaling factors for PrimingView

extension PrimingView {
    
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
    
}

//MARK: - Dimensions and constraint parameters for PrimingView

extension PrimingView {
    
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
    
}

