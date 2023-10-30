//
//  cadastro.swift
//  APAC V1
//
//  Created by user on 20/10/23.
//

import SwiftUI

struct cadastro: View {
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var name = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float = 0
    @State private var wrongEmail: Float = 0
    @State private var wrongName: Float = 0
    @State private var showingLoginScreen = false
    var body: some View {
   
            ZStack { // Usamos um ZStack para sobrepor os elementos
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all) // Configura o degradê para ocupar a tela inteira            VStack {
                VStack {
                    Image(systemName: "cloud.fill") // Ícone de nuvem
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 100, height: 100)

                    Text("APAC")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, -25)
                    
                    Text("Cadastro")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Nome", text: $name)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongName))
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    NavigationLink("Registrar", destination: princiaplSwiftUIView())
                                      .foregroundColor(.white)
                                      .frame(width: 300, height: 50)
                                      .background(Color.blue)
                                      .cornerRadius(10)
                }
        }
    }
    struct cadastro_Previews: PreviewProvider {
        static var previews: some View {
            
            cadastro()
        }
    }
    
}
