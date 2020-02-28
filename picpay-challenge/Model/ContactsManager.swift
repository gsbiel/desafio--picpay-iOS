//
//  ContactsManager.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import Foundation

struct ContactsManager {
    
    var contactsList: [Contact] = [
    Contact(id: 1001, name: "Eduardo Santos", img: "https://randomuser.me/api/portraits/men/9.jpg", username: "@eduardo.santos"),
    Contact(id: 1002, name: "Marina Coelho", img: "https://randomuser.me/api/portraits/women/37.jpg", username: "@marina.coelho"),
    Contact(id: 1003, name: "Márcia da Silva", img: "https://randomuser.me/api/portraits/women/57.jpg", username: "@marcia.silva"),
    Contact(id: 1004, name: "Fabrício Val", img: "https://randomuser.me/api/portraits/men/98.jpg", username: "@fabricio.val"),
    Contact(id: 1005, name: "Júlia Magalhães", img: "https://randomuser.me/api/portraits/women/44.jpg", username: "@julia.magalhaes"),
    Contact(id: 1006, name: "Luma Pereira", img: "https://randomuser.me/api/portraits/women/13.jpg", username: "@luma.pereira"),
    Contact(id: 1007, name: "Danilo Gonçalves", img: "https://randomuser.me/api/portraits/men/55.jpg", username: "@danilo.goncalves"),
    Contact(id: 1008, name: "Amanda Souza", img: "https://randomuser.me/api/portraits/women/59.jpg", username: "@amanda.souza"),
    Contact(id: 1009, name: "Suely Abreu", img: "https://randomuser.me/api/portraits/women/80.jpg", username: "@suely.abreu"),
    Contact(id: 1010, name: "Elizângela Moraes", img: "https://randomuser.me/api/portraits/women/10.jpg", username: "@elizangela.moraes")
    ]
    
    func getContacts() -> [Contact] {
        return contactsList
    }
    
}
