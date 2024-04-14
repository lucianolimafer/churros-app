//
//  CollectionView.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Peça o melhor dos melhores **Churros**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke().opacity(0.4))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(24)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(productList, id: \.id) {item in SmallProductCard(product: item )
                                .environmentObject(cartManager)
                        }
                    })
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView().environmentObject(CartManager())
    }
}

//Small Product Card
struct SmallProductCard: View {
    var product: ProductModel
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -100)
                .rotationEffect(Angle(degrees: -20))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 85)
                    Text(product.category)
                        .font(.system(size: 10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text(product.price.formatted(.currency(code: "BRL")))
                            .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.white.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.leading, 10)
                })
            }
            .padding(20)
            .frame(width: 180, height: 215)
        }
        .frame(width: 180, height: 215)
        .background(product.color.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading, 10)
    }
}
