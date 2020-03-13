//
//  RegisterCardViewController.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 13/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class RegisterCardViewController: UIViewController {
    
    private var ownerTxtField: UITextField!
    private var cardNumberTxtField: UITextField!
    private var expirationDateTxtField: UITextField!
    private var cvvTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registerCardView = RegisterCardView(frame: UIScreen.main.bounds)
        self.view.addSubview(registerCardView)
        
        ownerTxtField = registerCardView.cardOwnerTxtField
        cardNumberTxtField = registerCardView.cardNumberTxtField
        expirationDateTxtField = registerCardView.expirationDateTxtField
        cvvTxtField = registerCardView.cvvTxtField
        
    }
}


