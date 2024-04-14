//
//  ContentView.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        VStack(alignment: .leading) {
            Home().environmentObject(cartManager)
            
            if cartManager.products.count > 0 {
                HStack {
                    Text("\(cartManager.products.count)")
                        .padding()
                        .background(.yellow)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading) {
                        Text("Carrinho")
                            .font(.system(size: 26, weight: .semibold))
                        
                        
                        Text("\(cartManager.products.count > 1 ? "\(cartManager.products.count)" : "") \(cartManager.products.count >= 1 ? "\(cartManager.products.count == 1 ? "\(cartManager.products.count) item" : "itens")" : "vazio")")
                            .font(.system(size: 18))
                    }
                    
                    Spacer()
                    
                    ForEach(cartManager.products, id: \.name) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .frame(width: 60, height: 60)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.leading, -40)
                    }
                }
                .padding(30)
                .frame(width: .infinity, height: 100)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .foregroundColor(.white)
                .padding(.vertical, -40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
