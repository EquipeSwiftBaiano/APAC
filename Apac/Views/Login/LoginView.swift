//
//  LoginView.swift
//  apac
//
//  Created by user on 29/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                
                Image("logotipo_azul")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 40)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 18) {
                    Text("Acessar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Text("Com o e-mail e senha para entra")
                    
                    TextInputField(placeHolder: "Usuario", value: $viewModel.username)
                        .frame(height: 52)
                        .background(Color(uiColor: .tertiarySystemBackground))
                        .cornerRadiusWithBorder(radius: 12, borderLineWidth: 1, borderColor: .gray)
                    
                    SecureInputField(placeHolder: "Senha", value: $viewModel.password)
                        .background(Color(uiColor: .tertiarySystemBackground))
                        .cornerRadiusWithBorder(radius: 12, borderLineWidth: 1, borderColor: .gray)
                    
                    HStack {
                        Spacer()
                        Button("Esqueci minha senha") {
                            self.authenticationManager.login()                            
                        }
                        .font(.system(size: 13))
                    }
                    
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 18) {
                    
                    Button(action: {
                        self.viewModel.login()
                    }, label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    
                    NavigationLink(destination: CadastroEtapasView(), label: {
                            Text("Cadastrar")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.white)
                                .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Text("Aplicativo de Prevenção de Acidentes e Catástrofes Naturais")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .font(.system(size: 14))
            }
            .padding(24)
            .background(Color(uiColor: .secondarySystemBackground))
            
            .navigationTitle("Login")
            .toolbar(.hidden)
        }
        
        .onAppear {
            self.viewModel.setup(self.authenticationManager)
        }
        
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Atenção"), message: Text(self.viewModel.messageError), dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            LoginView().environmentObject(AuthenticationManager(isAuthenticated: false))
            LoginView().environmentObject(AuthenticationManager(isAuthenticated: false)).preferredColorScheme(.dark)
        }
    }
}
