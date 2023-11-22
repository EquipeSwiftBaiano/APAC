//
//  LoginViewModel.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var showError = false
    
    @Published var messageError = ""
    
    private var authenticationManager: AuthenticationManager?
    
    func setup(_ authenticationManager: AuthenticationManager) {
      self.authenticationManager = authenticationManager
    }    

    @MainActor
    func login() async {
        
        guard let authenticationManager = self.authenticationManager else {
            return
        }
        
        guard !email.isEmpty, !password.isEmpty else {
            self.showError = true
            self.messageError = "Preencha os campos de Usuario e Senha."
            return
        }
        
        print("Email: \(email)")
        print("Password: \(password)")
                
        guard let result = await authenticationManager.login(self.email, self.password) else {
            return
        }
        
        self.showError = result.isError
        self.messageError = result.message
        
        
    }
    
}
