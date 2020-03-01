//
//  ContactsBackgroundView.swift
//  picpay-challenge
//
//  Created by user164622 on 3/1/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class ContactsBackGroundView: UIView {
    
    lazy var viewContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .black
        return container
    }()
    
    lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Contatos"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
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
        viewContainer.addSubview(contactLabel)
        self.addSubview(viewContainer)
        setupLayout()
    }
    
    private func setupLayout() {
    
        // viewContainer constraints
        viewContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        viewContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
         //contactLabel constraints
        contactLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 10).isActive = true
        contactLabel.leftAnchor.constraint(equalTo: viewContainer.leftAnchor, constant: 20).isActive = true
        contactLabel.rightAnchor.constraint(equalTo: viewContainer.rightAnchor, constant: -20).isActive = true
        contactLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
