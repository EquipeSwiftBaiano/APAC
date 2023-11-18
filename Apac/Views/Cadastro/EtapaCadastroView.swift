//
//  EtapaCadastroView.swift
//  apac
//
//  Created by user on 17/11/23.
//

import SwiftUI

struct EtapaCadastroView: View {
    
    @ObservedObject var viewModel: CadastroViewModel
    
    var body: some View {
                
        ZStack {
            
            GeometryReader { geometry in
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.gray]),
                            startPoint: UnitPoint(x: 0 + viewModel.activeColorOffset, y: 0.0),
                            endPoint: UnitPoint(x: 0 + viewModel.inactiveColorOffset, y: 0.0)
                        )
                    )
                    .frame(width: (geometry.size.width * 0.72), height: 2)
                    .position(x: (geometry.size.width * 0.5), y: 19)
                
                HStack {
                    ForEach(0..<viewModel.etapas.count, id: \.self) { index in
                        VStack {
                            Circle()
                                .foregroundColor(index <= viewModel.etapaAtual ? .blue : .gray)
                                .frame(width: 20, height: 20)
                            Text(viewModel.etapas[index])
                                .frame(width: 100)
                                .multilineTextAlignment(.center)
                                .font(.caption)
                                .foregroundColor(index <= viewModel.etapaAtual ? .blue : .gray)
                        }
                        if(index != viewModel.etapas.count - 1) {
                            Spacer()
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
        }
        .frame(height: 75)
        
        
    }
}

struct EtapaCadastroView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EtapaCadastroView(viewModel: CadastroViewModel())
    }
}
