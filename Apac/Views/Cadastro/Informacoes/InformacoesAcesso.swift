//
//  InformacoesAcesso.swift
//  apac
//
//  Created by user on 17/11/23.
//

import SwiftUI

struct InformacoesAcesso: View {
    
    @ObservedObject var viewModel: CadastroViewModel
    
    var body: some View {
        
        VStack {
            Spacer()
            
            List {
                Section(header: Text("Dados de Acesso")) {
                    
                    CadastroListRow(label: "Usuario", value: $viewModel.usuario.username)
                    
                    CadastroListRow(label: "Senha", value: $viewModel.senha, isPassword: true)
                    
                    CadastroListRow(label: "Confirmar Senha", value: $viewModel.confirmarSenha, isPassword: true)
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        
    }
}

struct InformacoesAcesso_Previews: PreviewProvider {
    static var previews: some View {
        InformacoesAcesso(viewModel: CadastroViewModel())
    }
}
