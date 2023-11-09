//
//  Indices.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct Indices: View {
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                HStack {
                    
                    CardIndice(geometry: geometry)
                    
                    Spacer()
                    
                    CardIndice(geometry: geometry)
                    
                    Spacer()
                    
                    CardIndice(geometry: geometry)
                    
                }
            }
        }
        .frame(height: 110)
        .cornerRadius(0)
    }
}

struct Indices_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
                .edgesIgnoringSafeArea(.all)
            
            Indices()
        }
    }
}
