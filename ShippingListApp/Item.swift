//
//  Item.swift
//  ShippingListApp
//
//  Created by ramil on 04.05.2021.
//

import Foundation

class Item: Codable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
