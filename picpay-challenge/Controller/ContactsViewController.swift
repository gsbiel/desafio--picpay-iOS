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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let contactsView = ContactsView(frame: UIScreen.main.bounds)
        
        self.view.addSubview(contactsView)
        
        contactLabel = contactsView.contactLabel
        
    }
}

