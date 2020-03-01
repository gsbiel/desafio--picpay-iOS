//
//  ContactsViewHeaders.swift
//  picpay-challenge
//
//  Created by user164622 on 2/29/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {}
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}

class SearchContactHeaderCell: BaseCollectionReusableView {
    
    lazy var textField: UITextField = {
        let txtfld = UITextField()
        txtfld.translatesAutoresizingMaskIntoConstraints = false
        txtfld.backgroundColor = MyUtilityFunctions.hexColor(hexString: "#2B2C2F")
        return txtfld
    }()
    
    override func setupView() {
        
        setupLayout()
    }
    
    func setupLayout() {
        
    }
}
