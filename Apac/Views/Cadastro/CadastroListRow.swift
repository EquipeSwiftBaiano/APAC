//
//  CadastroListRow.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct CadastroListRow: View {
    @Binding var value: String
    var label: String = "Default"
    
    var body: some View {
        TextField(label, text: $value)
            .listRowBackground(Color(uiColor: .tertiarySystemBackground))
    }
}

struct CadastroListRow_Previews: PreviewProvider {
    
    @State static var value = ""
    
    static var previews: some View {
        List{
            CadastroListRow(value: $value)
        }
    }
}
