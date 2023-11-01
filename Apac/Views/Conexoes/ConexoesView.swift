//
//  ConexoesView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct ConexoesView: View {
    
    @State private var isModalPresented = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                HStack{
                    Image(systemName: "person.fill.badge.plus")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(24)
            .navigationTitle("Conexões")
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
            
            .sheet(isPresented: $isModalPresented, content: {
                Text("Conteudo do modal")
            })
            
            .toolbar {
                Button(action: {
                    self.isModalPresented.toggle()
                }, label: {
                    Image(systemName: "person.fill.badge.plus")
                })
            }
        }
        
    }
}

struct ConexoesView_Previews: PreviewProvider {
    static var previews: some View {
        ConexoesView()
    }
}
