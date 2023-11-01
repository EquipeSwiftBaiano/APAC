//
//  AuthenticationManager.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation
import SwiftUI

class AuthenticationManager: ObservableObject, AuthenticationProtocol {
    
    @Published var isAuthenticated: Bool
    
    init(isAuthenticated: Bool = false) {
        self.isAuthenticated = isAuthenticated
    }

    func login() {        
        isAuthenticated = true
    }
}
