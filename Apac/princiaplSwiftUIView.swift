//
//  princiaplSwiftUIView.swift
//  Apac
//
//  Created by Projeto nnt on 25/10/23.
//
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
                    VStack {
                        
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                            .padding()
                        
                 
                        NavigationSplitView {
                            Text("APAC")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        ForEach(weatherData, id: \.day) { weather in
                            HStack {
                                Text(weather.day)
                                    .font(.headline)
                                Spacer()
                                Text(weather.condition)
                                    .font(.subheadline)
                            }
                            .padding()
                        }
                    } detail: {
                        /*@START_MENU_TOKEN@*/Text("Detail")/*@END_MENU_TOKEN@*/
                    }                    }
                    .tabItem {
                        Image(systemName: "house")
                        Text("Início")
                    }
                    .tag(0)
                    
                    
                    Text("Amigos")
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
                    /*--------------------------------------------------------------------------------------------*/
                    VStack{
                                       NavigationView {
                                                  List(emergencyContacts) { contact in
                                                      HStack {
                                                          Text(contact.name)
                                                          Spacer()
                                                          Text(contact.phoneNumber)
                                                              .foregroundColor(.blue)
                                                              .onTapGesture {
                                                                  // Adicione código para chamar o número de telefone ao tocar
                                                                  if let phoneURL = URL(string: "tel://\(contact.phoneNumber)") {
                                                                      UIApplication.shared.open(phoneURL)
                                                                  }
                                                              }
                                                      }
                                                  }
                                                  .navigationTitle("Contatos de Emergência")
                                              }
                                           
                                          }
                                       .tabItem {
                                               Image(systemName: "phone.fill")
                                               Text("Chamadas")
                                           }
                                           .tag(3)
                    /*--------------------------------------------------------*/
            
                    VStack {
                        Image("profile_image_placeholder") // Substitua "profile_image_placeholder" pela imagem de perfil do usuário
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding()
                        
                        Text("Nome do Usuário") // Substitua pelo nome do usuário
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Endereço de Email") // Substitua pelo email do usuário
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding()
                        
                        
                        Text("Informações do Perfil")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text("Idade: 30 anos") // Substitua pela idade do usuário
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        Text("Localização: Cidade, País") // Substitua pela localização do usuário
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                 
                        
                        NavigationLink("Editar Perfil", destination: EditProfileView()) // Substitua "EditProfileView" pela visualização de edição de perfil
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.top, -10)
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
