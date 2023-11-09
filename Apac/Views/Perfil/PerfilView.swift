//
//  PerfilView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct PerfilView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private var isEditPerfilShow = false
    
    @State private var isConfigPerfilShow = false
    
    var body: some View {
        
        let usuario: Usuario = authenticationManager.user
        
        NavigationStack {
            
            VStack {
                Spacer(minLength: 1)
                
                List {
                    HStack {
                        Image(systemName: usuario.imageUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                            .foregroundColor(Color(uiColor: .label))
                        
                        VStack(alignment: .leading) {
                            Text(usuario.nome)
                                .font(.headline)
                                .foregroundColor(Color(uiColor: .label))
                                
                            Text(usuario.email)
                                .font(.caption)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            
                            Text(usuario.numero)
                                .font(.caption)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button("Editar") {
                            self.isEditPerfilShow.toggle()
                        }
                        .padding(10)
                        .buttonStyle(.borderless)
                    }
                    .listRowBackground(Color(uiColor: .tertiarySystemBackground))
                    
                    Section(header: Text("Informações Mapeamento")) {
                        InformacaoMapeamentoListRow(label: "Tipo de Risco", value: 1)
                        InformacaoMapeamentoListRow(label: "Tipo de Risco", value: 2)
                        InformacaoMapeamentoListRow(label: "Alerta de risco atual", value: 3)
                        
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
            
            .sheet(isPresented: $isEditPerfilShow, content: {
                EditarPerfilView()
            })
            .sheet(isPresented: $isConfigPerfilShow, content: {
                ConfiguracoesView()
            })
            
            .toolbar {
                Button(action: {
                    self.isConfigPerfilShow.toggle()
                }, label: {
                    Image(systemName: "gearshape")
                })
            }
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
