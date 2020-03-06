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
        
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
