
//
//  princiaplSwiftUIView.swift
//  APAC V1
//
//  Created by user on 20/10/23.
//

import SwiftUI
import WebKit
struct Weather {
    var day: String
    var condition: String
}
struct EmergencyContact: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
}
struct Person: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var isSelected: Bool

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
}

struct princiaplSwiftUIView: View {
    
    @State private var people: [Person] = [
           Person(name: "Alice", isSelected: false),
           Person(name: "Bob", isSelected: false),
           Person(name: "Charlie", isSelected: false)
       ]

    
    @State private var selectedTab = 0
    @State private var showActionSheet = false
    @State private var selectedOption: Int?
    @State private var showAlert = false

    var weatherData: [Weather] = [
        Weather(day: "Segunda", condition: "Ensolarado"),
        Weather(day: "Terça", condition: "Chuvoso"),
        Weather(day: "Quarta", condition: "Nublado"),
        Weather(day: "Quinta", condition: "Chuvoso"),
        Weather(day: "Sexta", condition: "Ensolarado"),
        Weather(day: "Sábado", condition: "Parcialmente Nublado"),
        Weather(day: "Domingo", condition: "Ensolarado")
    ]
    
    var emergencyContacts: [EmergencyContact] = [
           EmergencyContact(name: "Polícia", phoneNumber: "190"),
           EmergencyContact(name: "Bombeiros", phoneNumber: "193"),
           EmergencyContact(name: "SAMU", phoneNumber: "192"),
           EmergencyContact(name: "Defesa Civil", phoneNumber: "199"),
           // Adicione mais contatos de emergência conforme necessário
       ]
    var body: some View {
        
      
        NavigationView {
            VStack {
                
                
                TabView(selection: $selectedTab) {
                    NavigationView {Home() // Aqui você deve definir sua tela de Cadastro (CadastroView)
                
                           }
                    
                                   
                    .tabItem {
                        Image(systemName: "house")
                        Text("Início")
                    }
                    .tag(0)
                    /*--------------------------------------------------------------*/
                    NavigationView {FriendsSearchView() // Aqui você deve definir sua tela de Cadastro (CadastroView)
                            .navigationTitle("Procurar")
                           }

                        .tabItem {
                            
                            Image(systemName: "person.2.fill")
                            Text("Amigos")
                        }
                        .tag(1)
                    /*---------------------------------------------------------------------------------*/
                    
                     
                         
                              
                              VStack {
                                  Section(header: Text("Lista de Pessoas")) {
                                      List(people) { person in
                                          HStack {
                                              Text(person.name)
                                              Spacer()
                                              Toggle("", isOn: $people[people.firstIndex(of: person)!].isSelected)
                                          }
                                      }

                                      Text("Enviar Alerta")
                                                      .font(.largeTitle)
                                                      .foregroundColor(.white)
                                                      .frame(width: 300, height: 50)
                                                      .background(Color.red)
                                                      .cornerRadius(10)
                                                      .padding(.top, -20)
                                                      .onTapGesture {
                                                          showActionSheet = true
                                                      }
                                                      .foregroundColor(.accentColor)
                                                      .padding()
                                                      .alert(isPresented: $showAlert) {
                                                          Alert(
                                                              title: Text("Alerta emitido"),
                                                              message: Text("Seu alerta foi enviado com sucesso."),
                                                              dismissButton: .default(Text("OK"))
                                                          )
                                                      }
                                              }
                                              .actionSheet(isPresented: $showActionSheet) {
                                                  ActionSheet(
                                                      title: Text("Escolha uma opção de notificação"),
                                                      buttons: [
                                                          .default(Text("Avisar vizinho")) {
                                                              // Lógica para avisar o vizinho
                                                              selectedOption = 1
                                                              showAlert = true // Exibe o alerta após escolher a opção
                                                          },
                                                          .default(Text("Avisar parente")) {
                                                              // Lógica para avisar o parente
                                                              selectedOption = 2
                                                              showAlert = true // Exibe o alerta após escolher a opção
                                                          },
                                                          .default(Text("Avisar a Todos")) {
                                                              // Lógica para avisar a todos
                                                              selectedOption = 3
                                                              showAlert = true // Exibe o alerta após escolher a opção
                                                          },
                                                          .cancel()
                                                      ]
                                                  )                          }
                        }
                               .tabItem {
                                   Image(systemName: "bell.fill")
                                   Text("Notificações")
                               }
                               .tag(2)
                    /*---------------------------------------------------------------------------------------------*/
                    NavigationView {ligacoes()
                            .navigationTitle("Contatos de Emergência")
                
                           }
                    .tabItem {
                            Image(systemName: "phone.fill")
                            Text("Chamadas")
                        }
                        .tag(3)
                    /*---------------------------------------------------------*/
            
                    NavigationView {TeladePerfil()
                            .navigationTitle("Perfil")
                
                           }

                    .tabItem {
                        Image(systemName: "person.fill") // Você pode escolher um ícone apropriado
                        Text("Perfil")
                    }
                    .tag(4)
                }
                .accentColor(.blue)
                .navigationBarHidden(true)
                .navigationTitle("APAC")
                
            }
        }
    }
        
    }


        
        

struct princiaplSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        princiaplSwiftUIView()
    }
}
