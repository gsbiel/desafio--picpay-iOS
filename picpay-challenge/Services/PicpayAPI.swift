//
//  PicpayAPI.swift
//  picpay-challenge
//
//  Created by user164622 on 3/6/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PicpayAPI {
    
    private static let contactUrl: String = "http://careers.picpay.com/tests/mobdev/users"
    private static let contactURL: String = "http://careers.picpay.com/tests/mobdev/transaction"
    
    static func fetchContacts(completion: @escaping((JSON) -> ())) {
        Alamofire.request(contactUrl).responseJSON { (response) in
            if response.result.isSuccess {
                let contactJSON: JSON = JSON(response.result.value!)
                completion(contactJSON)
            }
        }
    }
}
