//
//  PerfilView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct PerfilView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private var isModalPresented = false
    
    var body: some View {
        if let usuario: Usuario = authenticationManager.user {
            
            NavigationStack {
                
                VStack {
                    Spacer(minLength: 1)
                    
                    List {
                        HStack {
                            Image(systemName: usuario.imageUrl)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color(uiColor: .label))
                            
                            VStack(alignment: .leading) {
                                Text("Nome")
                                    
                                Text("Email")
                                
                                Text("Telefone")
                            }
                            .padding(.leading, 10)
                            Spacer()
                            Button("Editar") {
                                self.isModalPresented = true
                            }
                        }
                        
                        Section(header: Text("Informações Mapeamento")) {
                            PerfilMapeamentoListRow(label: "Tipo de Risco", value: 1)
                            PerfilMapeamentoListRow(label: "Tipo de Risco", value: 2)
                            PerfilMapeamentoListRow(label: "Alerta de risco atual", value: 3)
                            
                        }
                        
                        Section(header: Text("Informações Endereço")) {
                            PerfilEnderecoListRow(label: "Endereco", value: usuario.nome)
                            
                            PerfilEnderecoListRow(label: "Bairro", value: usuario.nome)
                            
                            PerfilEnderecoListRow(label: "CEP", value: usuario.nome)
                            
                            PerfilEnderecoListRow(label: "Cidade", value: usuario.nome)
                            
                            PerfilEnderecoListRow(label: "Estado", value: usuario.nome)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                }
                
                
                .navigationTitle("Perfil")
                .background(Color(uiColor: .secondarySystemBackground))
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
                
                .sheet(isPresented: $isModalPresented, content: {
                    EditarPerfilView()
                })
                
                .toolbar {
                    Button(action: {
                        self.isModalPresented.toggle()
                    }, label: {
                        Image(systemName: "gearshape")
                    })
                }
            }
            
        } else {
            
        }
        
    }
}

struct PerfilView_Previews: PreviewProvider {
    
    static let authenticationManager = AuthenticationManager()
    
    static var previews: some View {
        Group {
            PerfilView().environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }())
            
            PerfilView().environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }()).preferredColorScheme(.dark)
        }
    }
}
