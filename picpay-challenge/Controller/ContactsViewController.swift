//
//  ViewController.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    private var contactLabel: UILabel!
    private var contactsCV: UICollectionView!
    private var scaleFactor: CGFloat!
    private var headerTextField: UITextField!
    
    private var isKeyboardActive: Bool = false
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
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
        print("Keyboard opening...")
        isKeyboardActive = true
    }
    
    @objc private func keyBoardWillHide(_ notification: Notification) {
        print("KeyBoard closing...")
        isKeyboardActive = false
    }
    
    @objc private func dismissKeyboard() {
        if isKeyboardActive {
            headerTextField.endEditing(true)
        }
    }
}

extension ContactsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: CGFloat(300))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colors = [UIColor.blue, UIColor.green, UIColor.red]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.contactsViewCellIdentifier, for: indexPath)
        cell.backgroundColor = colors[indexPath.item]
        return cell
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

extension ContactsViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        highLightTextField(textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        removeTextFieldHighlight(textField)
        dismissKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    private func highLightTextField(_ textField: UITextField) {
        textField.tintColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
    }
    
    private func removeTextFieldHighlight(_ textField: UITextField) {
        textField.tintColor = UIColor(red: 0.673, green: 0.695, blue: 0.742, alpha: 1)
        textField.layer.borderColor = UIColor(red: 0.673, green: 0.695, blue: 0.742, alpha: 1).cgColor
    }

}



