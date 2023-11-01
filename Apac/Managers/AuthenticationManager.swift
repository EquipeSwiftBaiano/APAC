//
//  AuthenticationManager.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation
import SwiftUI

class AuthenticationManager: ObservableObject, AuthenticationProtocol {
    
    @Published var _isAuthenticated: Bool
    
    @Published private var _user: Usuario? = nil
    
    init(isAuthenticated: Bool = false) {
        self._isAuthenticated = isAuthenticated
    }    
    
    var isAuthenticated: Bool {
        get {
            return self._isAuthenticated
        }
    }
    
    var user: Usuario? {
        get {
            return self._user
        }
    }

    func login() {
        
        let usuarioID = UUID()
        
        self._user = Usuario(
            id: usuarioID,
            nome: "Seu Nome",
            email: "seu_email@example.com",
            numero: "123-456-7890",
            imageUrl: "person.circle"
        )
        
        guard self._user != nil else { return }
        
        addParentes(&self._user!)
        
        addVizinhos(&self._user!)
        /*
        print("User: ")
        print(user)
        
        print("Self User: ")
        print(self._user!)
        */
        self._isAuthenticated = true
    }
    
    func cadastrar() {
        self._isAuthenticated = true
    }
    
    
    private func addParentes(_ user: inout Usuario) {
        user.parentes = []
        for i in 1...6 {
            let parente = Usuario(
                id: UUID(),
                nome: "Parente \(i)",
                email: "parente\(i)@example.com",
                numero: "111-111-111\(i)",
                imageUrl: "person.circle"
            )
            user.parentes.append(parente)
        }
    }

    private func addVizinhos(_ user: inout Usuario) {
        user.vizinhos = []
        for i in 1...10 {
            let vizinho = Usuario(
                id: UUID(),
                nome: "Vizinho \(i)",
                email: "vizinho\(i)@example.com",
                numero: "222-222-222\(i)",
                imageUrl: "person.circle"
            )
            user.vizinhos.append(vizinho)
        }
    }
    
}
