//
//  AuthenticationManager.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation
import SwiftUI
import Firebase

class AuthenticationManager: ObservableObject, AuthenticationProtocol {
    
    @Published private var _isAuthenticated: Bool
    
    @Published private var _user: Usuario
    
    init() {
        self._user = Usuario()
        self._isAuthenticated = false
    }
    
    init(isAuthenticated: Bool = false) {
        self._user = Usuario()
        self._isAuthenticated = isAuthenticated
    }
    
    var isAuthenticated: Bool {
        get {
            return self._isAuthenticated
        }
    }
    
    var user: Usuario {
        get {
            return self._user
        }
    }
    
    @MainActor
    func login(_ email: String, _ password: String) async -> (isError: Bool, message: String)? {
        
        print("Login Username: \(email)")
        print("Login Password: \(password)")
        
        do {
            let authResultData = try await Auth.auth().signIn(withEmail: email, password: password)
            self._isAuthenticated = true
            return nil
        } catch {
            return (true, error.localizedDescription)
        }
    }
    

    func loginMock() -> Void {
        
        let usuarioID = UUID()
        
        self._user = Usuario(
            id: usuarioID,
            nome: "Seu Nome",
            email: "seu_email@example.com",
            numero: "123-456-7890",
            imageUrl: "person.circle"
        )
        
        addParentes(&self._user)
        
        addVizinhos(&self._user)
        /*
        print("User: ")
        print(user)
        
        print("Self User: ")
        print(self._user!)
        */
        
        self._isAuthenticated = true
    }
    
    func logout() {
        self._isAuthenticated = false
        self._user = Usuario()
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
