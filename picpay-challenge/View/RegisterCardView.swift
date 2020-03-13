//
//  RegisterCardView.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 13/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class RegisterCardView: UIView {
    
    lazy var titleViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var cardNumberTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    lazy var cardOwnerTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    lazy var expirationDateTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    lazy var cvvTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
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
        self.addSubview(titleViewLabel)
        self.addSubview(cardNumberTxtField)
        self.addSubview(cardOwnerTxtField)
        self.addSubview(expirationDateTxtField)
        self.addSubview(cvvTxtField)
        setupLayout()
    }
    
    private func setupLayout() {
        
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
