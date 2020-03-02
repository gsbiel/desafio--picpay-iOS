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
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    lazy var textField: UITextField = {
        let txtfld = UITextField()
        txtfld.translatesAutoresizingMaskIntoConstraints = false
        txtfld.backgroundColor = MyUtilityFunctions.hexColor(hexString: "#2B2C2F")
        return txtfld
    }()
    
    override func setupView() {
        container.addSubview(textField)
        self.addSubview(container)
        setupLayout()
    }
    
    func setupLayout() {
        // container constraints
        container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        //textField constraints
//        textFirl
    }
}
