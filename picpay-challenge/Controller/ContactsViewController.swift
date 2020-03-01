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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let contactsView = ContactsView(frame: UIScreen.main.bounds)
        
        self.view.addSubview(contactsView)
        
        scaleFactor = UIScreen.main.scale
        contactsCV = contactsView.contactsCV
        
        contactsCV.delegate = self
        contactsCV.dataSource = self
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
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.contactsViewBasicReusableHeaderView, for: indexPath)
            header.backgroundColor = UIColor.gray
            return header
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 50)
        }
        else {
            return CGSize(width: collectionView.bounds.width, height: 40)
        }
    }
    
}



