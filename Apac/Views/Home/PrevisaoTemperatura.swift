//
//  PrevisaoTemperatura.swift
//  apac
//
//  Created by user on 01/11/23.
//

import SwiftUI

struct PrevisaoTemperatura: View {
    var body: some View {
        ScrollView(.horizontal) {
            GeometryReader { geometry in
                
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 15) {
                    CardTemperaturaPrevisao(geometry: geometry)
                    CardTemperaturaPrevisao(geometry: geometry)
                    CardTemperaturaPrevisao(geometry: geometry)
                    CardTemperaturaPrevisao(geometry: geometry)
                    CardTemperaturaPrevisao(geometry: geometry)
                    CardTemperaturaPrevisao(geometry: geometry)
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
