//
//  PrimingViewController.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 09/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class PrimingViewController: UIViewController {
    
    // Os valores abaixo foram retirados do design
    private let cardWidthScaleFactor: CGFloat = 100 / 320
    private let cardHeightScaleFactor: CGFloat = 70.24 / 568
    
    private var cardWidth: CGFloat {
        return self.cardWidthScaleFactor * UIScreen.main.bounds.width
    }
    
    private var cardHeight: CGFloat {
        return self.cardHeightScaleFactor * UIScreen.main.bounds.height
    }
    
    override func viewDidLoad() {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 64, y: 64, width: self.cardWidth, height: self.cardHeight)
        layer.colors = [UIColor(red: 0.227, green: 0.795, blue: 1, alpha: 1).cgColor, UIColor(red: 0.016, green: 0.544, blue: 0.734, alpha: 1).cgColor]
        layer.locations = [0,1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.cornerRadius = 10
        layer.position = self.view.center
//        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 1, c: -1, d: 1, tx: 0, ty: 0))
        self.view.layer.addSublayer(layer)
    }
    
}
