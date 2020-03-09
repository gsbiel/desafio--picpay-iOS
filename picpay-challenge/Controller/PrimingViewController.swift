//
//  PrimingViewController.swift
//  picpay-challenge
//
//  Created by Gabriel Gaspar on 09/03/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import UIKit

class PrimingViewController: UIViewController {
    
    private var primingView: PrimingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primingView = PrimingView(frame: UIScreen.main.bounds)
        self.view.addSubview(primingView)
    }
    
}
