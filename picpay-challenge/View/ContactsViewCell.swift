//
//  ContactsCollectionViewCell.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class ContactsViewCell: UICollectionViewCell {
    
    
    lazy var contactImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 26
        image.backgroundColor = UIColor.gray
        return image
    }()
    
    lazy var contactInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var contactId: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var contactName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        label.numberOfLines = 0
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
        contactInfoView.addSubview(contactId)
        contactInfoView.addSubview(contactName)
        
        self.addSubview(contactImage)
        self.addSubview(contactInfoView)
        setupLayout()
    }
    
    private func setupLayout() {
        
        // contactImage constraints
        contactImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 52).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 52).isActive = true
        contactImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        // contactInfoView constraints
//        contactInfoView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contactInfoView.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 16).isActive = true
        contactInfoView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contactInfoView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // contactID constraints
        contactId.topAnchor.constraint(equalTo: contactInfoView.topAnchor, constant: 5).isActive = true
        contactId.leftAnchor.constraint(equalTo: contactInfoView.leftAnchor).isActive = true
        contactId.rightAnchor.constraint(equalTo: contactInfoView.rightAnchor).isActive = true
        
        // contactName constraints
        contactName.topAnchor.constraint(equalTo: contactId.bottomAnchor, constant: 3).isActive = true
        contactName.leftAnchor.constraint(equalTo: contactInfoView.leftAnchor).isActive = true
        contactName.rightAnchor.constraint(equalTo: contactInfoView.rightAnchor).isActive = true
    
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
