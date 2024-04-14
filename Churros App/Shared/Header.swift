//
//  Header.swift
//  Churros App
//
//  Created by Luciano Lima Ferreira on 04/04/24.
//

import SwiftUI

struct Header: View {
    @State var iconType = ""
    
    var body: some View {
        HStack {
            Text("Peça o melhor dos melhores **Churros**")
                .font(.system(size: 30))
                .padding(.trailing)
            
            Spacer()
            Image(systemName: iconType)
                .imageScale(.large)
                .padding()
                .frame(width: 70, height: 90)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke().opacity(0.4))
                .foregroundColor(.black)
        }
        .padding(24)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(iconType: "line.3.horizontal")
    }
}
