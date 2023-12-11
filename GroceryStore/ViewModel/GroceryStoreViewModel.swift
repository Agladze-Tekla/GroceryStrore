//
//  GroceryStoreViewModel.swift
//  GroceryStore
//
//  Created by Tekla on 12/10/23.
//

import Foundation

class GroceryStoreViewModel: ObservableObject {
    @Published var allItems: [GroceryItem] = []
    @Published var cartItems: [GroceryItem] = []
    
    var total: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    func setupInitialData() {
        allItems = [
            GroceryItem(name: "Apples", price: 2.99, quantity: 0),
            GroceryItem(name: "Milk", price: 1.99, quantity: 0),
            GroceryItem(name: "Bread", price: 2.49, quantity: 0),
            GroceryItem(name: "Eggs", price: 3.99, quantity: 0),
            GroceryItem(name: "Avocado", price: 1.99, quantity: 0),
            GroceryItem(name: "Salmon", price: 9.99, quantity: 0),
            GroceryItem(name: "Tuna", price: 5.99, quantity: 0),
            GroceryItem(name: "Chicken Breast", price: 6.99, quantity: 0),
            GroceryItem(name: "Oatmeal", price: 3.49, quantity: 0)
        ]
    }
    
    func addToCart(item: GroceryItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(GroceryItem(name: item.name, price: item.price, quantity: 1))
        }
    }
    
    func removeFromCart(item: GroceryItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    func removeAllFromCart() {
        cartItems.removeAll()
    }
}
