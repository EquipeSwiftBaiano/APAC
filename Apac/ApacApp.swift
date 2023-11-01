//
//  apacApp.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

@main
struct apacApp: App {
    
    @StateObject private var authenticationManager = AuthenticationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authenticationManager)
        }
    }
}
