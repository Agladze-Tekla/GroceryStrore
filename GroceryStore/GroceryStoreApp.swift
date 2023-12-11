//
//  GroceryStoreApp.swift
//  GroceryStore
//
//  Created by Tekla on 12/10/23.
//

import SwiftUI

@main
struct GroceryStoreApp: App {
    @StateObject private var viewModel = GroceryStoreViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                AllProductsView(viewModel: viewModel)
                    .tabItem {
                        Label("All Products", systemImage: "list.bullet.rectangle")
                    }
                
                CartView(viewModel: viewModel)
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
        }
    }
}
