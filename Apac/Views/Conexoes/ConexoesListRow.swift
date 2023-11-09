//
//  ConexoesListRow.swift
//  apac
//
//  Created by user on 03/11/23.
//

import SwiftUI

struct ConexoesListRow: View {
    
    let usuario: Usuario
    
    var onDelete: (UUID, String) -> Void
    
    var onEdit: (UUID, String) -> Void
    
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
        .listRowBackground(Color(uiColor: .tertiarySystemBackground))
        .swipeActions(allowsFullSwipe: false) {
            Button(action: {
                print("Deletar")
                print(self.usuario)
                onDelete(self.usuario.id, self.usuario.nome)
            }, label: {
                Image(systemName: "trash.fill")
            })
            .tint(.red) // Cor do botão "Deletar"
            
            Button(action: {
                print("Editar")
                print(self.usuario)
                onEdit(self.usuario.id, self.usuario.nome)
            }, label: {
                Image(systemName: "pencil")
            })
            .tint(.blue) // Cor do botão "Editar"
            
        }
    }
}

struct ConexoesListRow_Previews: PreviewProvider {
    
    @State static var usuario = Usuario(id: UUID(), nome: "Fulano de Tal", email: "email@email.com", numero: "71988887777", imageUrl: "person.circle")
    
    static func onDelete(id: UUID, nome: String) -> Void {
        print("Deletar: \(id) | \(nome)")
    }
    static func onEdit(id: UUID, nome: String) -> Void {
        print("Editar: \(id) | \(nome)")
    }
    
    static var previews: some View {
        List{
            ConexoesListRow(usuario: usuario, onDelete: onDelete, onEdit: onEdit)
        }
    }
}
