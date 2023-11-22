//
//  EscolherAlertarView.swift
//  apac
//
//  Created by user on 30/10/23.
//

import SwiftUI

struct EscolherAlertarView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedUserIDs: Set<UUID> = []
    
    @Binding var isAlertSucess: Bool
    
    
    var body: some View {
        
        let parentes = authenticationManager.user.parentes
        
        let vizinhos = authenticationManager.user.vizinhos
        
        NavigationView {
            VStack(spacing: 8) {
                
                List(selection: $selectedUserIDs) {
                    if !parentes.isEmpty {
                        Section(header: Text("Parentes")) {
                            ForEach(parentes) { parente in
                                EscolherAlertaListRow(usuario: parente, isSelected: selectedUserIDs.contains(parente.id))
                            }
                        }
                    }
                    
                    if !vizinhos.isEmpty {
                        Section(header: Text("Vizinhos")) {
                            ForEach(vizinhos) { vizinho in
                                EscolherAlertaListRow(usuario: vizinho, isSelected: selectedUserIDs.contains(vizinho.id))
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                .environment(\.editMode, .constant(.active))                
                
                Spacer()
                
                Button(action: {
                    self.isAlertSucess.toggle()
                    self.dismiss()
                }, label: {
                    Text("Alertar")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color(uiColor: .tertiarySystemBackground))
                        .cornerRadius(10)
                        .padding(.horizontal, 18)
                })
                
                Spacer()
                
            }
            .background(Color(uiColor: .secondarySystemBackground))
            
            
            .navigationTitle("Selecionar pessoas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.isAlertSucess = false
                        self.dismiss()
                    }, label: {
                        Text("Fechar")
                    })
                }
            }
        }
    }
}

struct EscolherAlertarView_Previews: PreviewProvider {
    
    static let authenticationManager = AuthenticationManager()
    
    @State static var isAlertSucess = false
    
    static var previews: some View {
        Group {
            EscolherAlertarView(isAlertSucess: $isAlertSucess)
                .environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.loginMock()
                return envObj
            }())
            
            EscolherAlertarView(isAlertSucess: $isAlertSucess)
                .environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.loginMock()
                return envObj
            }()).preferredColorScheme(.dark)
        }
    }
}
