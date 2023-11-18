//
//  TelefonesUteisViewModel.swift
//  apac
//
//  Created by user on 17/11/23.
//

import Foundation
import LinkPresentation

class TelefonesUteisViewModel: ObservableObject {
        
    let telefonesUteis: [TelefoneUtil] = [
        TelefoneUtil(id: UUID(), nome: "Polícia", numero: "911"),
        TelefoneUtil(id: UUID(), nome: "Bombeiros", numero: "193"),
        TelefoneUtil(id: UUID(), nome: "Ambulância", numero: "192")
    ]
    
    func ligar(telefone: TelefoneUtil) {
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
    }
    
}
