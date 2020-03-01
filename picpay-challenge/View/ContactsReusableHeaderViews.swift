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

class ContactHeaderCell: BaseCollectionReusableView {
    
    lazy var contactHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Contatos"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    override func setupView() {
        self.backgroundColor = .black
        self.addSubview(contactHeaderLabel)
        setupLayout()
    }
    
    private func setupLayout() {
        // contactLabel constraints
        contactHeaderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contactHeaderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        contactHeaderLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        contactHeaderLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
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
