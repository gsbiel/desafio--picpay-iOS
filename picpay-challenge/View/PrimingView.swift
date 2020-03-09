//
//  PrimingView.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 09/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class PrimingView: UIView {
    
    // Fatores de Escalonamento: Os valores abaixo foram retirados do design feito no figma
    private let cardWidthScaleFactor: CGFloat = 100 / 320
    private let cardHeightScaleFactor: CGFloat = 70.24 / 568
    
    private var cardWidth: CGFloat {
        return self.cardWidthScaleFactor * UIScreen.main.bounds.width
    }
    private var cardHeight: CGFloat {
        return self.cardHeightScaleFactor * UIScreen.main.bounds.height
    }
    
    lazy var creditCard: CreditCardView = {
        // Tive que ja passar o frame da CreditCardView, pois a CAGradientLayer presente nesse componente precisa das dimensoes no momento que for inicializada, uma vez que nao e possivel configurar sublayers com autolayout.
        let card = CreditCardView(frame: CGRect(x: 0, y: 0, width: self.cardWidth, height: self.cardHeight))
        card.translatesAutoresizingMaskIntoConstraints = false
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
//        self.layer.addSublayer(gradientLayer)
        self.addSubview(creditCard)
        setupLayout()
    }
    
    private func setupLayout() {
        
        // creditCard constraints
        creditCard.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -1 * cardWidth / 2.0).isActive = true
        creditCard.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:  -1 * cardHeight / 2.0).isActive = true
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
}
