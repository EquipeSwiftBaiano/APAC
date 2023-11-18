//
//  LoginViewModel.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    
    @Published var showError = false
    
    @Published var messageError = ""
    
    private var authenticationManager: AuthenticationManager?
    
    func setup(_ authenticationManager: AuthenticationManager) {
      self.authenticationManager = authenticationManager
    }    

    func login() {
        
        guard let authenticationManager = self.authenticationManager else {
            return
        }
        
        guard !username.isEmpty, !password.isEmpty else {
            self.showError = true
            self.messageError = "Preencha os campos de Usuario e Senha."
            return
        }
        
        print("Username: \(username)")
        print("Password: \(password)")
        
        authenticationManager.login()
    }
    
}
