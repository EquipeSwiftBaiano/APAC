//
//  PrincipalView.swift
//  apac
//
//  Created by user on 30/10/23.
//

import SwiftUI

struct PrincipalView: View {
    
    @State private var selectedTab: TabsEnum = .home
    
    @State private var lastSelectedTab: TabsEnum = .home
    
    @State private var showActionSheet = false
    
    @State private var isModalPresented = false
    
    @State private var showAlert = false
    	
    var body: some View {
        TabView(selection: $selectedTab) {
            
            PrincipalTabItem(label: "Inicio", systemImage: "house", tag: .home, content: {
                HomeView()
            })
            
            PrincipalTabItem(label: "Conexões", systemImage: "person.line.dotted.person", tag: .conexoes, content: {
                ConexoesView()
            })
            
            PrincipalTabItem(label: "Alerta", systemImage: "bell.and.waveform.fill", tag: .alerta, content: {
                Text("")
            })
            
            PrincipalTabItem(label: "Telefones Úteis", systemImage: "teletype.answer.circle", tag: .telefonesUteis, content: {
                TelefonesUteisView()
            })
            
            PrincipalTabItem(label: "Perfil", systemImage: "person.crop.circle", tag: .perfil, content: {
                PerfilView()
            })
        }
        .onChange(of: selectedTab) { newValue in
            if newValue == .alerta {
                showActionSheet = true
                selectedTab = lastSelectedTab
            } else {
                lastSelectedTab = newValue
            }
        }
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Alerta emitido"), message: Text("Sub Titulo"), dismissButton: .default(Text("Ok")))
        }
        
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Ação de Exemplo"), buttons: [
                .default(Text("Alertar parentes")) {
                    showAlert.toggle()
                },
                .default(Text("Alertar vizinhos")) {
                    showAlert.toggle()
                },
                .default(Text("Escolher quem alertar")) {
                    isModalPresented.toggle()
                },
                .destructive(Text("Alertar todos")) {
                    showAlert.toggle()
                },
                .cancel() {
                }
            ])
        }
        
        .sheet(isPresented: $isModalPresented, content: {
            EscolherAlertarView(isSheetPresented: $isModalPresented)
                .onDisappear {
                    showAlert.toggle()
                    print("A view deixou de estar visível")
                }
        })
        
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            PrincipalView()
            PrincipalView().preferredColorScheme(.dark)
        }
    }
}
