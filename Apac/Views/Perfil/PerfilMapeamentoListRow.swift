//
//  PerfilMapeamentoListRow.swift
//  apac
//
//  Created by user on 04/11/23.
//

import SwiftUI

struct PerfilMapeamentoListRow: View {
    
    var label: String
    
    var value: Int
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            HStack {
                
                Image(systemName: "triangle.inset.filled")
                    .foregroundColor(value == 1 ? .green : Color(uiColor: .secondaryLabel))
                    .opacity(value == 1 ? 1 : 0.5)
                
                Image(systemName: "triangle.lefthalf.filled")
                    .foregroundColor(value == 2 ? .yellow : Color(uiColor: .secondaryLabel))
                    .opacity(value == 2 ? 1 : 0.5)
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(value == 3 ? .red : Color(uiColor: .secondaryLabel))
                    .opacity(value == 3 ? 1 : 0.5)
            }
            
        }
        .padding()
        .frame(height: 52)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowBackground(Color(uiColor: .tertiarySystemBackground))
    }
}

struct PerfilMapeamentoListRow_Previews: PreviewProvider {
    
    static var value: Int = 1
    
    static var label: String = "Default"
    
    static var previews: some View {
        PerfilMapeamentoListRow(label: "Mapeamento", value: 1)
    }
}
