//
//  ConexoesView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct ConexoesView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private var isAdicionarConexaoShow = false
    
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
    @State private var usuarioSelected: UUID? = nil
    
    @State private var showActionSheet = false
    
    
    func onDelete(id: UUID, nome: String) -> Void {
        print("Deletar: \(id) | \(nome)")
        self.usuarioSelected = id
    }
    
    func onEdit(id: UUID, nome: String) -> Void {
        print("Editar: \(id) | \(nome)")
        self.usuarioSelected = id
        self.showActionSheet.toggle()
    }
    
    var body: some View {
        
        let parentes = authenticationManager.user.parentes
        
        let vizinhos = authenticationManager.user.vizinhos
        
        NavigationView {
            List {
                if !parentes.isEmpty {
                    Section(header: Text("Parentes")) {
                        ForEach(parentes) { parente in
                            ConexoesListRow(usuario: parente, onDelete: onDelete, onEdit: onEdit)
                        }
                    }
                }
                
                if !vizinhos.isEmpty {
                    Section(header: Text("Vizinhos")) {
                        ForEach(vizinhos) { vizinho in
                            ConexoesListRow(usuario: vizinho, onDelete: onDelete, onEdit: onEdit)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            
            
            .navigationTitle("Conexões")
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
            
            .sheet(isPresented: $isAdicionarConexaoShow, content: {
                AdicionarConexaoView(isSheetPresented: $isAdicionarConexaoShow)
            })
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.isAdicionarConexaoShow.toggle()
                    }, label: {
                        Image(systemName: "person.fill.badge.plus")
                    })
                }
            }
        }
        
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Tipo de Conexão"), buttons: [
                .default(Text("Parente")) {
                    print("Selecionou: \(usuarioSelected)")
                    print("Trocar para Parente")
                },
                .default(Text("Vizinho")) {
                    print("Selecionou: \(usuarioSelected)")
                    print("Trocar para Vizinho")
                },
                .cancel() {
                }
            ])
        }
        
    }
}

struct ConexoesView_Previews: PreviewProvider {
    
    static let authenticationManager = AuthenticationManager()
    
    static var previews: some View {
        Group {
            ConexoesView().environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }())
            
            ConexoesView().environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }()).preferredColorScheme(.dark)
        }
    }
}
