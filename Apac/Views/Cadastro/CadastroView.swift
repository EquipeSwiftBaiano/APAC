//
//  CadastroView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct CadastroView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private var nome = ""
    
    @State private var email = ""
    
    @State private var numero = ""
    
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
                    
                    CadastroListRow(value: $nome, label: "Nome")
                    
                    CadastroListRow(value: $email, label: "Email")
                    
                    CadastroListRow(value: $numero, label: "Numero")
                }
                Section(header: Text("Endereço")) {
                    
                    CadastroListRow(value: $email, label: "Endereço")
                    
                    CadastroListRow(value: $email, label: "Bairro")
                    
                    CadastroListRow(value: $email, label: "CEP")
                    
                    CadastroListRow(value: $email, label: "Cidade")
                    
                    CadastroListRow(value: $email, label: "Estado")
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
            
            Spacer()
            
            Button("Cadastrar") {
                authenticationManager.login()                
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal, 18)
            
            Spacer()
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle("Cadastro")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        
    }
}

struct CadastroView_Previews: PreviewProvider {
    
    @State private var isShowingCadastro = false
    
    static var previews: some View {
        
        Group {
            NavigationStack {
                CadastroView()
            }
            NavigationStack {
                CadastroView().preferredColorScheme(.dark)
            }
        }
    }
}
