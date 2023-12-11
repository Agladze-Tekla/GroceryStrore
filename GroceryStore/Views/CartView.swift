//
//  CartView.swift
//  GroceryStore
//
//  Created by Tekla on 12/10/23.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: GroceryStoreViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.removeAllFromCart()
                        }) {
                            Text("Remove All")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    
                    if viewModel.cartItems.isEmpty {
                        Text("Your cart is empty.")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        let uniqueItemNames = Array(Set(viewModel.cartItems.map { $0.name }))
                        
                        ForEach(uniqueItemNames, id: \.self) { itemName in
                            if let item = viewModel.cartItems.first(where: { $0.name == itemName }) {
                                let quantity = viewModel.cartItems.filter { $0.name == itemName }.count
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text("$ \(String(item.price))")
                                        Text("Quantity: \(quantity)")
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Button(action: {
                                            viewModel.removeFromCart(item: item)
                                        }) {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(.red)
                                        }
                                        .padding()
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                        
                        HStack {
                            Spacer()
                            Text("Total: $\(String(viewModel.total))")
                                .font(.headline)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Cart")
        }
    }
}
