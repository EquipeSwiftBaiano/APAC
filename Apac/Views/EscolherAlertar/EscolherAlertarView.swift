//
//  EscolherAlertarView.swift
//  apac
//
//  Created by user on 30/10/23.
//

import SwiftUI

struct EscolherAlertarView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Conteudo Quem Aleretar")
            }
            .navigationTitle("Selecionar pessoas")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EscolherAlertarView_Previews: PreviewProvider {
    static var previews: some View {
        EscolherAlertarView()
    }
}
