//
//  PrevisaoTemperatura.swift
//  apac
//
//  Created by user on 01/11/23.
//

import SwiftUI

struct PrevisaoTemperatura: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 15) {
                        ForEach(1..<20) { _ in
                            CardTemperaturaPrevisao(geometry: geometry)
                        }
                    }
                }
            }
        }
        .frame(height: 140)
    }
}

struct PrevisaoTemperatura_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: .blue))
                .edgesIgnoringSafeArea(.all)
            
            PrevisaoTemperatura()
        }
    }
}
