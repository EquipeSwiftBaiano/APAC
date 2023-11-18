//
//  InformacoesPessoais.swift
//  apac
//
//  Created by user on 17/11/23.
//

import SwiftUI

struct InformacoesPessoais: View {
    
    @ObservedObject var viewModel: CadastroViewModel
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 18){
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                
                Text("Adicionar Foto")
            }
            .padding(.top)
            
            Spacer()
            
            List {
                Section(header: Text("Dados Pessoais")) {
                    
                    CadastroListRow(label: "Nome", value: $viewModel.usuario.nome)
                    
                    CadastroListRow(label: "Email", value: $viewModel.usuario.email)
                    
                    CadastroListRow(label: "Numero", value: $viewModel.usuario.numero)
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        
    }
}

struct InformacoesPessoais_Previews: PreviewProvider {
    static var previews: some View {
        InformacoesPessoais(viewModel: CadastroViewModel())
    }
}
