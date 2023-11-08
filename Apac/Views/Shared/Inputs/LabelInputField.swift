//
//  LabelInputField.swift
//  apac
//
//  Created by user on 08/11/23.
//

import SwiftUI

struct LabelInputField: View {
    
    let placeHolder: String
    
    let value: String
    
    var body: some View {
        
        HStack {
            ZStack(alignment: .leading) {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .offset(y: value.isEmpty ? 0 : -25)
                    .scaleEffect(value.isEmpty ? 1: 0.8, anchor: .leading)
                    .animation(.easeInOut(duration: 0.3), value: !value.isEmpty)
                
                Text(value)
            }
            Spacer()
        }
        .padding(.top, value.isEmpty ? 0 : 15)
        .frame(height: 52)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}

struct LabelInputField_Previews: PreviewProvider {
    
    
    static var previews: some View {
        LabelInputField(placeHolder: "Usuario", value: "SwiftBaiano")
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadiusWithBorder(radius: 12, borderLineWidth: 1, borderColor: .gray)
    }
}
