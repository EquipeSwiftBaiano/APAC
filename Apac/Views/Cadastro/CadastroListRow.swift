//
//  CadastroListRow.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct CadastroListRow: View {
    
    var label: String
    
    @Binding var value: String
    
    var isPassword: Bool = false
    
    var body: some View {
        if(!isPassword) {
            TextInputField(placeHolder: label, value: $value)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color(uiColor: .tertiarySystemBackground))
        } else {
            SecureInputField(placeHolder: label, value: $value)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color(uiColor: .tertiarySystemBackground))
        }
    }
}

struct CadastroListRow_Previews: PreviewProvider {
    
    @State static var value = ""
    static var label: String = "Default"
    
    static var previews: some View {
        List{
            CadastroListRow(label: label, value: $value)
        }
    }
}
