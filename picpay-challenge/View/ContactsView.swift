//
//  ContactsView.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class ContactsView: UIView {
    
    lazy var contactsView: UIView = {
        let container  = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
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
    
    lazy var contactsCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        layout.sectionHeadersPinToVisibleBounds = true
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: K.contactsViewCellIdentifier)
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: K.contactsViewHeaderIdentifier)
        return cv
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
        contactsView.addSubview(contactLabel)
        contactsView.addSubview(contactsCV)
        self.addSubview(contactsView)
        setupLayout()
    }
    
    private func setupLayout(){
        
        // contactsView constraints
        contactsView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contactsView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        contactsView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        // contactLabel constraints
        contactLabel.topAnchor.constraint(equalTo: contactsView.topAnchor).isActive = true
        contactLabel.leftAnchor.constraint(equalTo: contactsView.leftAnchor, constant: 20).isActive = true
        contactLabel.rightAnchor.constraint(equalTo: contactsView.rightAnchor, constant: -20).isActive = true
        contactLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        // contactsCV constraints
        contactsCV.topAnchor.constraint(equalTo: contactsView.topAnchor).isActive = true
        contactsCV.bottomAnchor.constraint(equalTo: contactsView.bottomAnchor).isActive = true
        contactsCV.leftAnchor.constraint(equalTo: contactsView.leftAnchor).isActive = true
        contactsCV.rightAnchor.constraint(equalTo: contactsView.rightAnchor).isActive = true
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
