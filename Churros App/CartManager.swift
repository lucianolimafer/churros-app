//
//  CartManager.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [ProductModel] = []
    @Published private(set) var total: Double = 0
    
    func addToCart(product: ProductModel) {
        products.append(product)
        
        total += product.price
    }
    
    func removeFromCart(product: ProductModel) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
