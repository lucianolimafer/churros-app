//
//  ProductCard.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct ProductCard: View {
    var product: ProductModel
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -240)
                .rotationEffect(Angle(degrees: -30))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 180)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text(product.price.formatted(.currency(code: "BRL")))
                            .font(.system(size: 24, weight: .semibold))
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -80)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                })
            }
            .padding(24)
            .frame(width: 324, height: 422)
        }
        .padding(24)
        .frame(width: 324, height: 422)
        .background(product.color.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .padding(.leading, 24)
    }
}
