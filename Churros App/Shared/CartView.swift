//
//  CartView.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Carrinho")
                        .font(.system(size: 30))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("\(cartManager.products.count)")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .background(.yellow.opacity(0.5))
                            .clipShape(Capsule())
                    }
                    .foregroundColor(.black)
                }
                .padding()
                
                //Cart Products
                VStack (spacing: 20) {
                    ForEach(cartManager.products) { item in CartProductView(product: item)}
                }
                .padding(.horizontal)
                
                // Card Total
                VStack(alignment: .leading) {
                    HStack {
                        Text("Valor da Entrega")
                        Spacer()
                        Text("R$ 5,90")
                            .font(.system(size: 24, weight: .semibold))
                    }
                    
                    Divider()
                    
                    Text("Valor total")
                        .font(.system(size: 24))
                    Text(cartManager.total.formatted(.currency(code: "BRL")))
                        .font(.system(size: 36, weight: .semibold))
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(.yellow.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .padding()
                
                
                //Buttons
                Button {
                    
                } label: {
                    Text("Efetuar Pagamento")
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.yellow.opacity(0.5))
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding()
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(CartManager())
    }
}

// Product Card View
struct CartProductView: View {
    var product: ProductModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray)
                .clipShape(Circle())
            
            VStack(alignment: .leading, content: {
                Text(product.name)
                    .font(.headline)
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            
            Text(product.price.formatted(.currency(code: "BRL")))
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}
