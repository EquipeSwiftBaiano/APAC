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
    
    let borderColor : Color
    
    let backgroundColor : Color
    
    @State var isAnimate: Bool = false
    
    init(placeHolder: String, value: Binding<String>, borderColor: Color = .gray,  backgroundColor: Color = Color(uiColor: .tertiarySystemBackground)) {
        self.placeHolder = placeHolder
        self._value = value
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeHolder)
                .foregroundColor(Color(.placeholderText))
                .offset(y: value.isEmpty ? 0 : -25)
                .scaleEffect(value.isEmpty ? 1: 0.8, anchor: .leading)
            SecureField("", text: $value)
        }
        .padding(.top, value.isEmpty ? 0 : 15)
        .frame(height: 52)
        .padding(.horizontal, 16)
        .background(backgroundColor)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
                    .foregroundColor(borderColor)
        )
        .animation(.default, value: isAnimate)
    }
}

struct SecureInputField_Previews: PreviewProvider {
    
    @State static var value = ""
    
    static var previews: some View {
        SecureInputField(placeHolder: "Senha", value: $value)
    }
}
