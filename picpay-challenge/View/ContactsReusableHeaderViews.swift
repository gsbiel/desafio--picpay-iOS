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
        txtfld.placeholder = K.searchTxtFieldPlaceHolder
        txtfld.textColor = .white
        txtfld.tintColor = UIColor(red: 0.673, green: 0.695, blue: 0.742, alpha: 1)
        txtfld.layer.cornerRadius = 20
        txtfld.backgroundColor = UIColor(red: 0.167, green: 0.173, blue: 0.183, alpha: 1)
//        txtfld.
        return txtfld
    }()
    
    lazy var searchIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        let imageIcon = UIImage(named: K.searchIconName)!.withRenderingMode(.alwaysTemplate)
        icon.image = imageIcon
        return icon
    }()
    
    lazy var eraseIcon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "x"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.alpha = 0
        return label
    }()
    
    override func setupView() {
        
        textField.leftViewMode = .always
        textField.leftView = searchIcon
        textField.rightViewMode = .always
        textField.rightView = eraseIcon
        
        textField.addSubview(searchIcon)
        textField.addSubview(eraseIcon)
        
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
        textField.topAnchor.constraint(equalTo: container.topAnchor, constant: 3).isActive = true
        textField.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -3).isActive = true
        textField.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16).isActive = true
        textField.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16).isActive = true
        
        // searchIcon
        searchIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        searchIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // eraseIcon
        eraseIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        eraseIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true

    }
}
