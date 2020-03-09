//
//  CreditCardView.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 09/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class CreditCardView: UIView {
    
    // Fatores de Escalonamento: Os valores abaixo foram tirados do design feito no figma
    private var innerSymbolWidthScaleFactor: CGFloat {
        return CGFloat(K.creditCardInnerCardSymbolWidthRef / K.creditCardWidthRef)
    }
    private var innerSymbolHeightScaleFactor: CGFloat {
        return CGFloat(K.creditCardInnerCardSymbolHeightRef / K.creditCardHeightRef)
    }
    
    // Definindo as dimensoes do simbolo que fica dentro do CreditCardView, respeitando a proporcionalidade entre o layout do figma e o layout da tela onde o app esta rodando
    private var innerSymbolWidth: CGFloat {
        return self.innerSymbolWidthScaleFactor * self.frame.width
    }
    private var innerSymbolHeight: CGFloat {
        return self.innerSymbolHeightScaleFactor * self.frame.height
    }
    
    lazy var innerCardSymbol: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: self.innerSymbolWidth, height: self.innerSymbolHeight)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        let constant = self.frame.width - innerCardSymbol.frame.width - 8.96
        // innerCardSymbol constraints
        innerCardSymbol.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant).isActive = true
        innerCardSymbol.topAnchor.constraint(equalTo: self.topAnchor, constant: 9.01).isActive = true
        
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
