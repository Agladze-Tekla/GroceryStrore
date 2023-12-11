//
//  AllProductsView.swift
//  GroceryStore
//
//  Created by Tekla on 12/10/23.
//

import SwiftUI

struct AllProductsView: View {
    @ObservedObject var viewModel: GroceryStoreViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.allItems) { item in
                        HStack {
                            Button(action: {
                                viewModel.addToCart(item: item)
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.green)
                            }
                            .padding()
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text("$ \(String(item.price))")
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
                .padding()
            }
            .onAppear {
                viewModel.setupInitialData()
            }
            .navigationTitle("All Products")
        }
    }
}
