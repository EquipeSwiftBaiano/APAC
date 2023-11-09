//
//  SecureInputField.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct SecureInputField: View {
    
    let placeHolder: String
    
    @Binding var value: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Text(placeHolder)
                .foregroundColor(Color(.placeholderText))
                .offset(y: value.isEmpty ? 0 : -25)
                .scaleEffect(value.isEmpty ? 1: 0.8, anchor: .leading)
                .animation(.easeInOut(duration: 0.3), value: !value.isEmpty)
            
            SecureField("", text: $value)
        }
        .padding(.top, value.isEmpty ? 0 : 15)
        .frame(height: 52)
        .padding(.horizontal, 16)
        
    }
}

struct SecureInputField_Previews: PreviewProvider {
    
    @State static var value = ""
    
    static var previews: some View {
        SecureInputField(placeHolder: "Senha", value: $value)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadiusWithBorder(radius: 12, borderLineWidth: 1, borderColor: .gray)
    }
}
