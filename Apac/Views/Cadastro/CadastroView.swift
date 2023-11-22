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
                Section(header: Text("Dados de Acesso")) {
                    
                    CadastroListRow(label: "Usuario", value: $nome)
                    
                    CadastroListRow(label: "Senha", value: $email, isPassword: true)
                    
                    CadastroListRow(label: "Confirmar Senha", value: $numero, isPassword: true)
                }
                
                Section(header: Text("Dados Pessoais")) {
                    
                    CadastroListRow(label: "Nome", value: $nome)
                    
                    CadastroListRow(label: "Email", value: $email)
                    
                    CadastroListRow(label: "Numero", value: $numero)
                }
                
                Section(header: Text("Endereço")) {
                    
                    CadastroListRow(label: "Endereço", value: $email)
                    
                    CadastroListRow(label: "Bairro", value: $email)
                    
                    CadastroListRow(label: "CEP", value: $email)
                    
                    CadastroListRow(label: "Cidade", value: $email)
                    
                    CadastroListRow(label: "Estado", value: $email)
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            
            Spacer()
            
                
            Button(action: {
                authenticationManager.loginMock()
            }, label: {
                Text("Cadastrar")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 18)
            })
            
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
