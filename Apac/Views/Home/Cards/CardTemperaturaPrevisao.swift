//
//  CardTemperaturaPrevisao.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct CardTemperaturaPrevisao: View {
    
    var geometry: GeometryProxy
    
    var body: some View {
        
        VStack {
            
            Text("Day")
                .textCase(.uppercase)
                .font(.system(size: 12))
                .foregroundColor(Color(uiColor: .secondaryLabel))
            
            Spacer()
            
            Image(systemName: "sun.min.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            
            Spacer()
            
            
            Text("27")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(uiColor: .label))
        }
        .frame(height: geometry.size.height - 20)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color(uiColor: .tertiarySystemBackground))
        .cornerRadius(20)
    }
}

struct CardTemperaturaPrevisao_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack {
                GeometryReader { geometry in
                    HStack {
                        
                        Spacer()
                        
                        
                        CardTemperaturaPrevisao(geometry: geometry)
                        
                        Spacer()
                        
                    }
                }
            }
            .frame(height: 140)
            .cornerRadius(0)
        }
    }
}
