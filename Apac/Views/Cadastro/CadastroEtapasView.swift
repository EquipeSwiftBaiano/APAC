//
//  CadastroEtapasView.swift
//  apac
//
//  Created by user on 17/11/23.
//

import SwiftUI

struct CadastroEtapasView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: CadastroViewModel = CadastroViewModel()
    
    var body: some View {
        
        VStack {
            EtapaCadastroView(viewModel: viewModel)
            
            Spacer()            
            
            switch viewModel.etapaAtual {
                case 0:
                    InformacoesPessoais(viewModel: viewModel)
                case 1:
                    InformacoesEndereco(viewModel: viewModel)
                case 2:
                    InformacoesAcesso(viewModel: viewModel)
                default:
                    EmptyView()
            }
            
            Spacer()
            
            
            Button(action: {
                viewModel.proximaEtapa()
            }, label: {
                Text(viewModel.mensagemBotao)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 18)
            })
            
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .secondarySystemBackground))
        
        .navigationTitle("Cadastro")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        
        /*.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.dismiss()
                }, label: {
                    Text("Cancelar")
                })
            }
        }*/
        
        .onAppear {
            self.viewModel.setup(self.authenticationManager)
            
            //self.viewModel.clear()
        }
        
    }
}

struct CadastroEtapasView_Previews: PreviewProvider {
    
    @State private var isShowingCadastro = false
    
    static var previews: some View {
        
        Group {
            NavigationStack {
                CadastroEtapasView()
            }
            NavigationStack {
                CadastroEtapasView().preferredColorScheme(.dark)
            }
        }
    }
}
