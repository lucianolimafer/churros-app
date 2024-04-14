//
//  CategoryModel.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "Todos"),
    CategoryModel(icon: "choco", title: "Chocolate"),
    CategoryModel(icon: "wafles", title: "Oreo"),
    CategoryModel(icon: "toffee", title: "Bombom"),
]
