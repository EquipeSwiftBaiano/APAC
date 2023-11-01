//
//  Dicas.swift
//  apac
//
//  Created by user on 01/11/23.
//

import SwiftUI

struct Dicas: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .label
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.label.withAlphaComponent(0.2)
    }
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                TabView {
                    ForEach(1...12, id: \.self) { index in
                        VStack (spacing: 6) {
                            Text("Titulo")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(Color(uiColor: .label))
                            
                            Text("Esta vindo uma onda de calor, beba agua...")
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                                .font(.system(size: 11))
                        }
                        .padding(EdgeInsets(top: -16, leading: 20, bottom: 0, trailing: 20))
                        .frame(width: geometry.size.width - 20, height: geometry.size.height-2)
                        .background(Color(uiColor: .tertiarySystemBackground))
                        .cornerRadius(20)
                        .offset(x: 0, y: 6)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page)
                .frame(height: 120)
                .offset(x: 0, y: -26)
            }
        }
        .frame(height: 80)
        .cornerRadius(0)
    }
}

struct Dicas_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: .blue))
                .edgesIgnoringSafeArea(.all)
            
            Dicas()
        }
    }
}
