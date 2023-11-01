//
//  ContentView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager

    var body: some View {
        if authenticationManager.isAuthenticated {
            PrincipalView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView().environmentObject(AuthenticationManager())
            
            ContentView().environmentObject(AuthenticationManager(isAuthenticated: true))
        }
    }
}
