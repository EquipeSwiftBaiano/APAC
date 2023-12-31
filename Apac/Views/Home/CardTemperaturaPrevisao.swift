//
//  CardTemperaturaPrevisao.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct CardTemperaturaPrevisao: View {
    var body: some View {        
            VStack {
                Text("Day")
                    .textCase(.uppercase)
                    .font(.system(size: 14))
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Spacer()
                
                Image(systemName: "sun.min.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                
                Spacer()
                
                Text("27")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color(uiColor: .label))
            }
            .frame(height: 120)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
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
            
            CardTemperaturaPrevisao()
        }
    }
}
