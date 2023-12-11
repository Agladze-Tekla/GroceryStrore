//
//  GroceryItem.swift
//  GroceryStore
//
//  Created by Tekla on 12/10/23.
//

import Foundation

struct GroceryItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}
