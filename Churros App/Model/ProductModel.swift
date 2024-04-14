//
//  ProductModel.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct ProductModel: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Double
}

var productList: [ProductModel] = [
    ProductModel(name: "Chocolate ao leite", category: "Chocolate", image: "image 1", color: .gray, price: 10.90),
    ProductModel(name: "Bolacha Óreo com chocolate", category: "Oreo", image: "image 2", color: .brown, price: 12.40),
    ProductModel(name: "Caramelo com M&M`s", category: "Bombom", image: "image 3", color: .green, price: 8.90),
]
