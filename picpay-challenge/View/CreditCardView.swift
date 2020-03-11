//
//  CreditCardView.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 09/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class CreditCardView: UIView {
    
    lazy var innerCardSymbol: UIView = {
        let view = UIView()
        
        let positionX = self.frame.width - innerSymbolWidth - innerSymbolLeadingAnchorConstant
        view.frame = CGRect(x: positionX, y: self.innerSymbolTopAnchorConstant, width: self.innerSymbolWidth, height: self.innerSymbolHeight)
        view.layer.cornerRadius = 4
        
        // Criando o gradiente para a view
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.innerSymbolWidth, height: self.innerSymbolHeight)
        gradient.colors = [UIColor(red: 1, green: 0.919, blue: 0, alpha: 1).cgColor, UIColor(red: 1, green: 0.82, blue: 0, alpha: 1).cgColor]
        gradient.locations = [0,1]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.cornerRadius = 4
        
        view.layer.addSublayer(gradient)
        return view
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        layer.colors = [UIColor(red: 0.227, green: 0.795, blue: 1, alpha: 1).cgColor, UIColor(red: 0.016, green: 0.544, blue: 0.734, alpha: 1).cgColor]
        layer.locations = [0,1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.cornerRadius = 10
        layer.position = self.center
        return layer
    }()
    
    lazy var cardNumberField: UIView = {
        let stack = UIView(frame: CGRect(x: 10, y: self.numberFieldStrokeTopAnchorConstant, width: self.frame.width - 20, height: self.numberFieldStrokeHeight))
        stack.backgroundColor = .white
        return stack
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
        self.layer.addSublayer(gradientLayer)
        self.addSubview(innerCardSymbol)
        
        // Adding strokes to cardNumberField stackView
//        let stroke1 = UILabel(frame: CGRect(x: 0, y: 0, width: numberFieldStrokeWidth, height: numberFieldStrokeHeight))
//        stroke1.backgroundColor = .white
//        let stroke2 = UILabel(frame: CGRect(x: 0, y: 0, width: numberFieldStrokeWidth, height: numberFieldStrokeHeight))
//        stroke2.backgroundColor = .white
//        let stroke3 = UILabel(frame: CGRect(x: 0, y: 0, width: numberFieldStrokeWidth, height: numberFieldStrokeHeight))
//        stroke3.backgroundColor = .white
//        let stroke4 = UILabel(frame: CGRect(x: 0, y: 0, width: numberFieldStrokeWidth, height: numberFieldStrokeHeight))
//        stroke4.backgroundColor = .white
        
//        let stroke2 = stroke1.copy() as! CreditCardNumberStroke
//        let stroke3 = stroke1.copy() as! CreditCardNumberStroke
//        let stroke4 = stroke1.copy() as! CreditCardNumberStroke
//        cardNumberField.addArrangedSubview(stroke1)
//        cardNumberField.addArrangedSubview(stroke2)
//        cardNumberField.addArrangedSubview(stroke3)
//        cardNumberField.addArrangedSubview(stroke4)
        
        self.addSubview(cardNumberField)
    }
}

//MARK: - Scaling factors for creditCardInnerSymbol, creditCardNumberFieldStroke and creditCardNameFieldStroke

extension CreditCardView {
    
    // ---------------------------------------------------------------------------------------------
    // creditCardInnerSymbol -----------------------------------------------------------------------
    
    private var innerSymbolWidthScaleFactor: CGFloat {
        return CGFloat(K.creditCardInnerCardSymbolWidthRef / K.creditCardWidthRef)
    }
    
    private var innerSymbolHeightScaleFactor: CGFloat {
        return CGFloat(K.creditCardInnerCardSymbolHeightRef / K.creditCardHeightRef)
    }
    
    private var innerSymbolLeadingAnchorScaleFactor: CGFloat {
        return CGFloat( K.creditCardInnerCardTrailingAnchorRef / K.creditCardWidthRef)
    }
    
    private var innerSymbolTopAnchorScaleFactor: CGFloat {
        return CGFloat( K.creditCardInnerCardTopAnchorRef / K.creditCardHeightRef )
    }
    
    // ---------------------------------------------------------------------------------------------
    // creditCardNumberFieldStroke -----------------------------------------------------------------
    
    private var numberFieldStrokeWidthScaleFactor: CGFloat {
        return CGFloat( K.creditCardNumberFieldStrokeWidthRef / K.creditCardWidthRef)
    }
    
    private var numberFieldStrokeHeightScaleFactor: CGFloat {
        return CGFloat( K.creditCardNumberFieldStrokeHeightRef / K.creditCardHeightRef )
    }
    
    private var numberFieldStrokeTopAnchorScaleFactor: CGFloat {
        return CGFloat(K.creditCardNumberFieldStrokeTopAnchorRef / K.creditCardHeightRef )
    }
    
    // ---------------------------------------------------------------------------------------------
    // creditCardNameFieldStroke -------------------------------------------------------------------
    
    private var nameFieldStrokeWidthScaleFactor: CGFloat {
        return CGFloat( K.creditCardNameFieldStrokeWidthRef / K.creditCardWidthRef)
    }
    
    private var nameFieldStrokeHeightScaleFactor: CGFloat {
        return CGFloat( K.creditCardNameFieldStrokeHeightRef / K.creditCardHeightRef )
    }
    
    // dataFieldLeadingAnchor -> name field and number field have the same value for this anchor
    private var dataFieldStrokeLeadingAnchorScaleFactor: CGFloat {
        return CGFloat( K.dataFieldStrokeLeadingAnchorRef / K.creditCardWidthRef)
    }

}

//MARK: - Dimensions and constraint parameters for creditCardInnerSymbol, creditCardNumberFieldStroke and creditCardNameFieldStroke

extension CreditCardView {
    
    // ---------------------------------------------------------------------------------------------
    // creditCardInnerSymbol -----------------------------------------------------------------------
    
    private var innerSymbolWidth: CGFloat {
        return self.innerSymbolWidthScaleFactor * self.frame.width
    }
    
    private var innerSymbolHeight: CGFloat {
        return self.innerSymbolHeightScaleFactor * self.frame.height
    }
    
    private var innerSymbolLeadingAnchorConstant: CGFloat {
        return innerSymbolLeadingAnchorScaleFactor * self.frame.width
    }
    
    private var innerSymbolTopAnchorConstant: CGFloat {
        return innerSymbolTopAnchorScaleFactor * self.frame.height
    }
    
    // ---------------------------------------------------------------------------------------------
    // creditCardNumberFieldStroke -----------------------------------------------------------------
    
    private var numberFieldStrokeWidth: CGFloat {
        return numberFieldStrokeWidthScaleFactor * self.frame.width
    }
    
    private var numberFieldStrokeHeight: CGFloat {
        return numberFieldStrokeHeightScaleFactor * self.frame.height
    }
    
    private var numberFieldStrokeTopAnchorConstant: CGFloat {
        return numberFieldStrokeTopAnchorScaleFactor * self.frame.height
    }
    
    // ---------------------------------------------------------------------------------------------
    // creditCardNameFieldStroke -------------------------------------------------------------------
    
    private var nameFieldStrokeWidth: CGFloat {
        return nameFieldStrokeWidthScaleFactor * self.frame.width
    }
    
    private var nameFieldStrokeHeight: CGFloat {
        return nameFieldStrokeHeightScaleFactor * self.frame.height
    }
    
    // dataFieldStrokeLeadingAnchor -> name field and number field have the same value for this anchor
    private var dataFieldStrokeLeadingAnchorConstant: CGFloat {
        return dataFieldStrokeLeadingAnchorScaleFactor * self.frame.width
    }
    
}

//class CreditCardNumberStroke: UILabel, NSCopying {
//
//    required override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupLabel()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupLabel()
//    }
//
//    private func setupLabel() {
//        self.backgroundColor = UIColor.white
//    }
//
//    func copy(with zone: NSZone? = nil) -> Any {
//        return type(of: self).init(frame: self.frame)
//    }
//}


