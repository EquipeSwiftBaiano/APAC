//
//  CardIndice.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct CardIndice: View {
    
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 12) {
            
            Image(systemName: "sun.min.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            
            VStack(spacing: 4) {
                Text("Indice UV")
                    .font(.system(size: 14))
                    .foregroundColor(Color(uiColor: .label))
                
                Text("Baixo")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .frame(width: geometry.size.width / 3 - 10, height: geometry.size.height)
        .background(Color(uiColor: .tertiarySystemBackground))
        .cornerRadius(20)
    }
}

struct CardIndice_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
                
            ZStack {
                Rectangle()
                    .foregroundColor(Color(uiColor: .secondarySystemBackground))
                    .edgesIgnoringSafeArea(.all)
                                    
                ZStack {
                    GeometryReader { geometry in
                        HStack {
                            
                            Spacer()
                            
                            CardIndice(geometry: geometry)
                            
                            Spacer()
                            
                        }
                    }
                }
                .frame(height: 110)
                .cornerRadius(0)
            }
        }
        
    }
}
