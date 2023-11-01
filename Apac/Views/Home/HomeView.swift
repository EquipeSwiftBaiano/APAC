//
//  HomeView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                
                CardTemperatura()
                
                Spacer()
                
                Dicas()
                
                Spacer()
                
                Indices()
                
                Spacer()
                
                PrevisaoTemperatura()
                
            }
            .frame(maxWidth: .infinity)
            .padding(24)               
            .navigationTitle("Pagina Inicial")
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
