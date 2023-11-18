//
//  TelefonesUteisView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI


struct TelefonesUteisView: View {
    
    @ObservedObject var viewModel: TelefonesUteisViewModel = TelefonesUteisViewModel()
    
    var body: some View {
        
        NavigationView{
                
            VStack {
                Spacer(minLength: 1)
                List(viewModel.telefonesUteis, id: \.id) { telefone in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(telefone.nome)
                                .foregroundColor(Color(uiColor: .label))
                                .font(.system(size: 18))
                            
                            Text(telefone.numero)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                                .font(.system(size: 14))
                        }
                        Spacer()
                        Button(action: {
                            viewModel.ligar(telefone: telefone)
                        }, label: {
                            Image(systemName: "phone.and.waveform.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                    .listRowBackground(Color(uiColor: .tertiarySystemBackground))
                }
                .background(Color(uiColor: .secondarySystemBackground))
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
                .scrollDisabled(true)
            }
            
            
            .navigationTitle("Telefones Úteis")
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        }
        
    }
}

struct TelefonesUteisView_Previews: PreviewProvider {
    static var previews: some View {
        TelefonesUteisView()
    }
}
