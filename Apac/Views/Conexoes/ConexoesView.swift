//
//  ConexoesView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct ConexoesView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private var isModalPresented = false
    
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                if let parentes = authenticationManager.user?.parentes, !parentes.isEmpty {
                    Section(header: Text("Parentes")) {
                        ForEach(parentes) { parente in
                            ConexoesListRow(usuario: parente)
                        }
                    }
                }
                
                if let vizinhos = authenticationManager.user?.vizinhos, !vizinhos.isEmpty {
                    Section(header: Text("Vizinhos")) {
                        ForEach(vizinhos) { vizinho in
                            ConexoesListRow(usuario: vizinho)
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
            
            .sheet(isPresented: $isModalPresented, content: {
                Text("Conteudo do modal")
            })
            
            .toolbar {
                Button(action: {
                    self.isModalPresented.toggle()
                }, label: {
                    Image(systemName: "person.fill.badge.plus")
                })
            }
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
