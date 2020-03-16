//
//  RegisterCardView.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 13/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class RegisterCardView: UIView {
    
//MARK: - UI elements
    
    //--------------------------------------------------------------
    // UI element for view's title ---------------------------------
    
    lazy var titleViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ola praxer"
        
        return label
    }()
    
    //--------------------------------------------------------------
    // UI elements for card number field ---------------------------
    
    lazy var cardNumberTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        txtField.backgroundColor = .blue
        return txtField
    }()
    
    lazy var cardNumberBottomLine: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    //--------------------------------------------------------------
    // UI elements for card owner field ----------------------------
    
    lazy var cardOwnerTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        txtField.backgroundColor = .blue
        return txtField
    }()
    
    lazy var cardOwnerBottomLine: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    //--------------------------------------------------------------
    // UI elements for expiration date field -----------------------
    
    lazy var expirationDateTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    lazy var expirationDateBottomLine: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    //--------------------------------------------------------------
    // UI elements for cvv field -----------------------------------
    
    lazy var cvvTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    lazy var cvvBottomLine: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
//MARK: - View's Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
//MARK: - Setup and Layout view functions
    
    private func setupView() {
        self.backgroundColor = K.backGroundTheme
        self.addSubview(titleViewLabel)
        self.addSubview(cardNumberTxtField)
        self.addSubview(cardOwnerTxtField)
//        self.addSubview(expirationDateTxtField)
//        self.addSubview(cvvTxtField)
        setupLayout()
    }
    
    private func setupLayout() {
        
        // titleViewLabel constraints
        titleViewLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleViewLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: self.titleLabelHorizontalAnchorsConstant).isActive = true
        titleViewLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: self.titleLabelHorizontalAnchorsConstant).isActive = true
        titleViewLabel.heightAnchor.constraint(equalToConstant: self.titleLabelHeight).isActive = true
        
        // cardNumberTxtField constraints
        cardNumberTxtField.topAnchor.constraint(equalTo: titleViewLabel.bottomAnchor, constant: cardNumberTxtFieldTopAnchorConstant).isActive = true
        cardNumberTxtField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: self.cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstant).isActive = true
        cardNumberTxtField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -self.cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstant).isActive = true
        cardNumberTxtField.heightAnchor.constraint(equalToConstant: self.cardNumberAndCardOwnerTxtFieldHeight).isActive = true
        
        // cardOwnerTxtField constraints
        cardOwnerTxtField.topAnchor.constraint(equalTo: cardNumberTxtField.bottomAnchor, constant: cardOwnerTxtFieldTopAnchorConstant).isActive = true
        cardOwnerTxtField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: self.cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstant).isActive = true
        cardOwnerTxtField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -self.cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstant).isActive = true
        cardOwnerTxtField.heightAnchor.constraint(equalToConstant: self.cardNumberAndCardOwnerTxtFieldHeight).isActive = true
        
        // expirationDateTxtField constraints
        //expirationDateTxtField.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>).isActive = true
        
        // cvvTxtField constraints
        //cvvTxtField.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>).isActive = true
        
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}

extension RegisterCardView {
    
    // -----------------------------------------------------------------------------------------------
    // titleLabel ------------------------------------------------------------------------------------
    
    private var titleLabelHorizontalAnchorsConstantScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewTitleLabelHorizontalAnchorsConstantRef / K.primingViewWidthRef )
    }
    
    private var titleLabelWidthScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewTitleLabelWidthRef / K.primingViewWidthRef )
    }
    
    private var titleLabelHeightScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewTitleLabelHeightRef / K.primingViewHeightRef )
    }
    
    // -----------------------------------------------------------------------------------------------
    // cardNumberTxtField  and cardOwnerTxtField -----------------------------------------------------
    
    private var cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstantScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewCardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstantRef / K.primingViewWidthRef )
    }
    
    private var cardNumberAndCardOwnerTxtFieldHeightScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewCardNumberAndCardOwnerTxtFieldHeightRef / K.primingViewHeightRef )
    }
    
    private var cardNumberTxtFieldTopAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewCardNumberTopAnchorConstantRef / K.primingViewHeightRef )
    }
    
    private var cardOwnerTxtFieldTopAnchorConstantScaleFactor: CGFloat {
        return CGFloat( K.registerCardViewCardOwnerTopAnchorConstantRef / K.primingViewHeightRef )
    }
}

extension RegisterCardView {
    
    // -----------------------------------------------------------------------------------------------
    // titleLabel ------------------------------------------------------------------------------------
    private var titleLabelHorizontalAnchorsConstant: CGFloat {
        return CGFloat( self.titleLabelHorizontalAnchorsConstantScaleFactor * self.frame.width )
    }
    
    private var titleLabelWidth: CGFloat {
        return CGFloat( self.titleLabelWidthScaleFactor * self.frame.width )
    }
    
    private var titleLabelHeight: CGFloat {
        return CGFloat( self.titleLabelHeightScaleFactor * self.frame.height )
    }
    
    // -----------------------------------------------------------------------------------------------
    // cardNumberTxtField  and cardOwnerTxtField -----------------------------------------------------
    
    private var cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstant: CGFloat {
        return self.cardNumberAndCardOwnerTxtFieldHorizontalAnchorsConstantScaleFactor * self.frame.width
    }
    
    private var cardNumberAndCardOwnerTxtFieldHeight: CGFloat {
        return cardNumberAndCardOwnerTxtFieldHeightScaleFactor * self.frame.height
    }
    
    private var cardNumberTxtFieldTopAnchorConstant: CGFloat {
        return cardNumberTxtFieldTopAnchorConstantScaleFactor * self.frame.height
    }
    
    private var cardOwnerTxtFieldTopAnchorConstant: CGFloat {
        return cardOwnerTxtFieldTopAnchorConstantScaleFactor * self.frame.height
    }
    
}
