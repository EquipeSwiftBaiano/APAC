//
//  PerfilInformacaoListRow.swift
//  apac
//
//  Created by user on 04/11/23.
//

import SwiftUI

struct PerfilEnderecoListRow: View {
    
    var label: String
    
    var value: String
    
    var body: some View {
        LabelInputField(placeHolder: label, value: value)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color(uiColor: .tertiarySystemBackground))
    }
}

struct PerfilEnderecoListRow_Previews: PreviewProvider {
    
    static var value: String = "Valor"
    
    static var label: String = "Default"
    
    static var previews: some View {
        PerfilEnderecoListRow(label: label, value: value)
        
    }
}
