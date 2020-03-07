//
//  ViewController.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON

class ContactsViewController: UIViewController {

    private var contactLabel: UILabel!
    private var contactsCV: UICollectionView!
    private var scaleFactor: CGFloat!
    private var headerTextField: UITextField!
    
    private var isKeyboardActive: Bool = false
    
    private var contacts: [Contact] = [Contact]()
    
// MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let contactsView = ContactsView(frame: UIScreen.main.bounds)
        
        self.view.addSubview(contactsView)
        
        scaleFactor = UIScreen.main.scale
        contactsCV = contactsView.contactsCV
        
        contactsCV.delegate = self
        contactsCV.dataSource = self
        
        let gestureSensor = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(gestureSensor)
        
        fetchContacts()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    private func updateContactList() {
        if self.contacts.count == 0 {
           fetchContacts()
        }
        self.contactsCV.reloadData()
    }
    
    private func fetchContacts() {
        PicpayAPI.fetchContacts { (response) in
            for contact in response {
                let id = contact.1["id"].intValue
                let name = contact.1["name"].stringValue
                let img = contact.1["img"].stringValue
                let username = contact.1["username"].stringValue
                self.contacts.append(Contact(id: id, name: name, img: img, username: username))
            }
            self.updateContactList()
        }
    }
    
//MARK: - Keyboard notifications and actions
    
    private func registerForKeyboardNotifications() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyBoardWillBeShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterForKeyboardNotifications() {
        let center = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyBoardWillBeShown(_ notification: Notification) {
        isKeyboardActive = true
    }
    
    @objc private func keyBoardWillHide(_ notification: Notification) {
        isKeyboardActive = false
    }
    
    @objc private func dismissKeyboard() {
        if isKeyboardActive {
            headerTextField.endEditing(true)
        }
    }
}

//MARK: - CollectionView datasource and delegate

extension ContactsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        else{
            return self.contacts.count + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: CGFloat(40))
        }
        else {
           return CGSize(width: collectionView.frame.width, height: CGFloat(52))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.contactsBaseViewCellIdentifier, for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.contactsViewCellIdentifier, for: indexPath) as! ContactsViewCell
            cell.contactId.text = self.contacts[indexPath.item-1].username
            cell.contactName.text = self.contacts[indexPath.item-1].name
            cell.contactImage.sd_setImage(with: URL(string: self.contacts[indexPath.item-1].img
            ), completed: nil)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 0 {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.contactsViewBasicReusableHeaderView, for: indexPath)
            header.isHidden = true
            return header
            
        }else{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.contactsViewSearchHeaderIdentifier, for: indexPath) as! SearchContactHeaderCell
            
            header.textField.delegate = self
            self.headerTextField = header.textField
            
            return header
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 50)
        }
        else {
            return CGSize(width: collectionView.bounds.width, height: 46)
        }
    }
    
}

//MARK: - Search text field delegate

extension ContactsViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        highLightTextField(textField)
        setEraseIconVisibility(of: textField, to: 1.0)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        removeTextFieldHighlight(textField)
        setEraseIconVisibility(of: textField, to: 0)
        dismissKeyboard()
        
        searchContacts(name: textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    private func searchContacts(name: String) {
        let searchQuery = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: nil)
        var searchResult = self.contacts.filter { (contact) -> Bool in
            let name = contact.name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: nil)
            return name.contains(searchQuery)
        }
        
        self.contacts = searchResult
        updateContactList()
        
    }
    
//MARK: - Search text field utility functions
    
    private func highLightTextField(_ textField: UITextField) {
        textField.tintColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
    }
    
    private func removeTextFieldHighlight(_ textField: UITextField) {
        textField.tintColor = UIColor(red: 0.673, green: 0.695, blue: 0.742, alpha: 1)
        textField.layer.borderColor = UIColor(red: 0.673, green: 0.695, blue: 0.742, alpha: 1).cgColor
        textField.layer.borderWidth = 0
    }
    
    private func setEraseIconVisibility(of textField: UITextField, to visibility: CGFloat){
        textField.rightView?.alpha = visibility
    }

}



