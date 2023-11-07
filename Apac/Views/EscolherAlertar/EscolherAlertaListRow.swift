//
//  EscolherAlertaRow.swift
//  apac
//
//  Created by user on 01/11/23.
//

import SwiftUI

struct EscolherAlertaListRow: View {
    
    let usuario: Usuario
    
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 18) {
            Image(systemName: usuario.imageUrl)
                .resizable()
                .frame(width: 38, height: 38)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(uiColor: .label))
            
            Text(usuario.nome)
                .font(.system(size: 16))
                .foregroundColor(Color(uiColor: .label))
        }
        .listRowBackground(isSelected ? Color(uiColor: .tertiarySystemBackground) : Color(uiColor: .secondarySystemBackground))
    }
}

struct EscolherAlertaListRow_Previews: PreviewProvider {
    
    @State static var usuario = Usuario(id: UUID(), nome: "Fulano de Tal", email: "email@email.com", numero: "71988887777", imageUrl: "person.circle")
    
    static var isSelected = false
    
    static var previews: some View {
        List{
            EscolherAlertaListRow(usuario: usuario, isSelected: isSelected)
        }
    }
}
