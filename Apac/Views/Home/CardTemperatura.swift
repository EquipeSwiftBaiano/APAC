//
//  CardTemperatura.swift
//  apac
//
//  Created by user on 31/10/23.
//

import SwiftUI

struct CardTemperatura: View {
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: .tertiarySystemBackground))
                .frame(height: 130)
            
            HStack {
                VStack(alignment: .leading, spacing: -8) {
                    Text("27º")
                        //.font(.custom("SFProRounded", size: 72))
                        .font(.system(size: 72))
                        .fontWeight(.bold)
                        .foregroundColor(Color(uiColor: .label))
                    
                    HStack {
                        HStack {
                            Image(systemName: "arrow.up")
                                //.font(.callout)
                                .font(.system(size: 12))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            
                            Text("30º")
                                //.font(.callout)
                                .font(.system(size: 12))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                        }
                        HStack {
                            Image(systemName: "arrow.down")
                                //.font(.callout)
                                .font(.system(size: 12))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            
                            Text("30º")
                            //.font(.callout)
                            .font(.system(size: 12))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 26, bottom: 16, trailing: 0))
                    
                    Text("Salvador - BA")
                        //.font(.headline)
                        .font(.system(size: 11))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                .padding(.horizontal)
                
                Spacer()
                
                Image(systemName: "carbon.monoxide.cloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .offset(x: -10, y: -20)
            }
        }
        
    }
}

struct CardTemperatura_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
                .edgesIgnoringSafeArea(.all)
            
            CardTemperatura()
        }
    }
}
