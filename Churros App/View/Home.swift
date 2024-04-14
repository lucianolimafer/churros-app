//
//  Home.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct Home: View {
    // Category List View Properties
    @State var selectedCategory: String = ""
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //Header
                    Header(iconType: "line.3.horizontal")
                    
                    //CategoryList
                    CategoryListView(selectedCategory: selectedCategory)
                    
                    //Collection View
                    HStack {
                        Text("Opções em **Chocolate**")
                            .font(.system(size: 24))
                        Spacer()
                        
                        NavigationLink {
                            CollectionView().environmentObject(CartManager())
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item).environmentObject(cartManager)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(CartManager())
    }
}


