//
//  PrincipalTabItem.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct PrincipalTabItem<Content: View>: View {
    var label: String
    var systemImage: String
    var tag: TabsEnum
    var content: () -> Content
    
    var body: some View {
        content()
            .tabItem {
                Label(label, systemImage: systemImage)
                    .foregroundColor(Color(uiColor: .systemPink))
            }
            .tag(tag)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .tabBar)
    }
}

struct PrincipalTabItem_Previews: PreviewProvider {
    static var previews: some View {        
        PrincipalTabItem(label: "Inicio", systemImage: "house", tag: .home, content: {
            HomeView()
        })
    }
}
