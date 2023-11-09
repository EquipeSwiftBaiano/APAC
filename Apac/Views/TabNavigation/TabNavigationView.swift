//
//  TabNavigationView.swift
//  apac
//
//  Created by user on 30/10/23.
//

import SwiftUI

struct TabNavigationView: View {
    
    @State private var selectedTab: TabsEnum = .home
    
    @State private var lastSelectedTab: TabsEnum = .home
    
    @State private var showActionSheet = false
    
    @State private var isModalPresented = false
    
    @State private var showAlert = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            NavigationItem(label: "Inicio", systemImage: "house", tag: .home, content: {
                HomeView()
            })
            
            NavigationItem(label: "Conexões", systemImage: "person.3", tag: .conexoes, content: {
                ConexoesView()
            })
            
            NavigationItem(label: "Alerta", systemImage: "bell.and.waveform.fill", tag: .alerta, content: {
                Text("")
            })
            
            NavigationItem(label: "Telefones Úteis", systemImage: "teletype.answer.circle", tag: .telefonesUteis, content: {
                TelefonesUteisView()
            })
            
            NavigationItem(label: "Perfil", systemImage: "person.crop.circle", tag: .perfil, content: {
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
        
        .sheet(isPresented: $isModalPresented, content: { EscolherAlertarView() })
        
    }
}

struct NavigationItem<Content: View>: View {
    var label: String
    var systemImage: String
    var tag: TabsEnum
    var content: () -> Content
    
    var body: some View {
        content()
            .tabItem {
                Label(label, systemImage: systemImage)
            }
            .tag(tag)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.white, for: .tabBar)
    }
}


struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
