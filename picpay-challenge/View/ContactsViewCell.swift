//
//  ContactsCollectionViewCell.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class ContactsViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        setupLayout()
    }
    
    private func setupLayout() {
        
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
}
