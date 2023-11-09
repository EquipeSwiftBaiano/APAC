//
//  ConfiguracoesView.swift
//  apac
//
//  Created by user on 06/11/23.
//

import SwiftUI

struct ConfiguracoesView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private var isNotificacaoEnabled = false
    @State private var isSonoroEnabled = false
    @State private var isVibracaoEnabled = false
    
    @State private var isPushEnabled = false
    @State private var isWhatsappEnabled = false
    @State private var isSMSEnabled = false
    
    var body: some View {
            
        NavigationView {
            
            VStack {
                Spacer()
                
                List {
                    Section(header: Text("Tipos de Alertas")) {
                        Toggle("Notificação", isOn: $isNotificacaoEnabled)
                        
                        Toggle("Sonoro", isOn: $isSonoroEnabled)
                        
                        Toggle("Vibração", isOn: $isVibracaoEnabled)
                    }
                    
                    Section(header: Text("Tipos de Notificação")) {
                        Toggle("Push Notification", isOn: $isPushEnabled)
                            .disabled(!isNotificacaoEnabled)
                        
                        Toggle("Whatsapp", isOn: $isWhatsappEnabled)
                            .disabled(!isNotificacaoEnabled)
                        
                        Toggle("SMS", isOn: $isSMSEnabled)
                            .disabled(!isNotificacaoEnabled)
                    }
                }
                .background(Color(uiColor: .secondarySystemBackground))
                .scrollContentBackground(.hidden)
                
                Spacer()
                
                Button("Sair da conta") {
                    authenticationManager.logout()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 18)
                
                Spacer()
            }
            .background(Color(uiColor: .secondarySystemBackground))
            
            
            .navigationTitle("Configuração")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        }
            
    }
}

struct ConfiguracoesView_Previews: PreviewProvider {
    static var previews: some View {
        ConfiguracoesView()
    }
}
