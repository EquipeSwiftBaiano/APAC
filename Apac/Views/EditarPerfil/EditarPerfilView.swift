//
//  EditarPerfilView.swift
//  apac
//
//  Created by user on 06/11/23.
//

import SwiftUI

struct EditarPerfilView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @Environment(\.dismiss) var dismiss
    
    @State private var nome = ""
    
    @State private var email = ""
    
    @State private var numero = ""
    
    var body: some View {
        
            NavigationView {
                
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
                            
                            EditarPerfilListRow(label: "Usuario", value: $nome)
                                .disabled(true)
                            
                            EditarPerfilListRow(label: "Senha", value: $email, isPassword: true)
                            
                            EditarPerfilListRow(label: "Confirmar Senha", value: $numero, isPassword: true)
                        }
                        
                        Section(header: Text("Dados Pessoais")) {
                            
                            EditarPerfilListRow(label: "Nome", value: $nome)
                            
                            EditarPerfilListRow(label: "Email", value: $email)
                            
                            EditarPerfilListRow(label: "Numero", value: $numero)
                        }
                        
                        Section(header: Text("Endereço")) {
                            
                            EditarPerfilListRow(label: "Endereço", value: $email)
                            
                            EditarPerfilListRow(label: "Bairro", value: $email)
                            
                            EditarPerfilListRow(label: "CEP", value: $email)
                            
                            EditarPerfilListRow(label: "Cidade", value: $email)
                            
                            EditarPerfilListRow(label: "Estado", value: $email)
                        }
                    }
                    .background(Color(uiColor: .secondarySystemBackground))
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Salvar informacoes")
                    }, label: {
                        Text("Salvar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 18)
                    })
                    
                    Spacer()
                }
                .background(Color(uiColor: .secondarySystemBackground))                
                
                .navigationTitle("Editar Perfil")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.dismiss()
                        }, label: {
                            Text("Fechar")
                        })
                    }
                }
                
            }
        
    }
}

struct EditarPerfilView_Previews: PreviewProvider {
    
    static let authenticationManager = AuthenticationManager()
    
    @State static var isModalPresented = false
    
    static var previews: some View {
        Group {
            EditarPerfilView().environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }())
            
            EditarPerfilView().environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }()).preferredColorScheme(.dark)
        }
    }
}
