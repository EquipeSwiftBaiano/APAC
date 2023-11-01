//
//  TelefonesUteisView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI
import LinkPresentation


struct TelefonesUteisView: View {
    
    private let telefonesUteis: [TelefoneUtil] = [
        TelefoneUtil(id: UUID(), nome: "Polícia", numero: "911"),
        TelefoneUtil(id: UUID(), nome: "Bombeiros", numero: "193"),
        TelefoneUtil(id: UUID(), nome: "Ambulância", numero: "192")
    ]
    
    var body: some View {
        
        NavigationView{
                
            List(telefonesUteis, id: \.id) { telefone in
                HStack {
                    VStack(alignment: .leading) {
                        Text(telefone.nome)
                            .foregroundColor(Color(uiColor: .label))
                            .font(.system(size: 18))
                        
                        Text(telefone.numero)
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                            .font(.system(size: 14))
                    }
                    Spacer()
                    Button(action: {
                        print("Clicoupara chamar")
                        if let phoneURL = URL(string: "tel://\(telefone.numero)") {
                            if UIApplication.shared.canOpenURL(phoneURL) {
                                UIApplication.shared.open(phoneURL)
                            } else {
                                print("Não é possível fazer chamadas neste dispositivo.")
                            }
                        } else {
                            print("Número de telefone inválido.")
                        }
                    }, label: {
                        Image(systemName: "phone.and.waveform.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .aspectRatio(contentMode: .fit)
                    })
                }
                .listRowBackground(Color(uiColor: .tertiarySystemBackground))
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            .scrollDisabled(true)
            .navigationTitle("Telefones Úteis")
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        }
        
    }
}

struct TelefonesUteisView_Previews: PreviewProvider {
    static var previews: some View {
        TelefonesUteisView()
    }
}
