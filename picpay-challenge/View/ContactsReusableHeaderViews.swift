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
    
    override func setupView() {
        
        setupLayout()
    }
    
    private func setupLayout() {
        
    }

}

class SearchContactHeaderCell: BaseCollectionReusableView {
    
    override func setupView() {
        
        setupLayout()
    }
    
    func setupLayout() {
        
    }
}
