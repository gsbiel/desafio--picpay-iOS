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
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 64, y: 64, width: self.cardWidth, height: self.cardHeight)
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
    }
    
    
}
