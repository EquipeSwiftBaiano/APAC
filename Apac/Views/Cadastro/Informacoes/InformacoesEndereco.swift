//
//  InformacoesEndereco.swift
//  apac
//
//  Created by user on 17/11/23.
//

import SwiftUI

struct InformacoesEndereco: View {
    
    @ObservedObject var viewModel: CadastroViewModel
    
    var body: some View {
        
        VStack {
            Spacer()
            
            List {
                
                Section(header: Text("Endereço")) {
                    
                    CadastroListRow(label: "Logradouro", value: $viewModel.usuario.endereco.logradouro)
                    
                    CadastroListRow(label: "Bairro", value: $viewModel.usuario.endereco.bairro)
                    
                    CadastroListRow(label: "CEP", value: $viewModel.usuario.endereco.cep)
                    
                    CadastroListRow(label: "Cidade", value: $viewModel.usuario.endereco.cidade)
                    
                    CadastroListRow(label: "Estado", value: $viewModel.usuario.endereco.estado)
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        
    }
}

struct InformacoesEndereco_Previews: PreviewProvider {
    static var previews: some View {
        InformacoesEndereco(viewModel: CadastroViewModel())
    }
}
