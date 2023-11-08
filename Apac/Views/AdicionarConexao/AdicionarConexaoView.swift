//
//  AdicionarConexaoView.swift
//  apac
//
//  Created by user on 08/11/23.
//

import SwiftUI

struct AdicionarConexaoView: View {
    
    let connectionTypes = ["Parente", "Vizinho"]
    
    @Binding var isSheetPresented: Bool
    
    @Environment(\.isSearching) private var isSearching: Bool
    
    @Environment(\.dismissSearch) private var dismissSearch
    
    @State private var selectedConnectionType = "Parente"
    
    @State private var searchText = ""
    
    @State private var _usuario: Usuario? = nil
    
    let usuariosFicticios: [Usuario] = [
        Usuario(id: UUID(), nome: "Alice Johnson", email: "alice@example.com", numero: "123-456-7890", imageUrl: "person.circle.fill"),
        Usuario(id: UUID(), nome: "Bob Smith", email: "bob@example.com", numero: "987-654-3210", imageUrl: "person.fill"),
        Usuario(id: UUID(), nome: "Carol Davis", email: "carol@example.com", numero: "456-789-0123", imageUrl: "person.crop.circle"),
        Usuario(id: UUID(), nome: "David Wilson", email: "david@example.com", numero: "789-012-3456", imageUrl: "person.2.fill"),
        Usuario(id: UUID(), nome: "Eve Brown", email: "eve@example.com", numero: "234-567-8901", imageUrl: "person.3.fill"),
        Usuario(id: UUID(), nome: "Frank Johnson", email: "frank@example.com", numero: "345-678-9012", imageUrl: "person.badge.plus.fill"),
        Usuario(id: UUID(), nome: "Grace Taylor", email: "grace@example.com", numero: "567-890-1234", imageUrl: "person.fill.turn.down"),
        Usuario(id: UUID(), nome: "Hank Miller", email: "hank@example.com", numero: "678-901-2345", imageUrl: "person.fill.checkmark"),
        Usuario(id: UUID(), nome: "Ivy Lee", email: "ivy@example.com", numero: "890-123-4567", imageUrl: "person.fill.questionmark"),
        Usuario(id: UUID(), nome: "Jackie Davis", email: "jackie@example.com", numero: "012-345-6789", imageUrl: "person.fill.xmark"),
        Usuario(id: UUID(), nome: "Alice Smith", email: "alice2@example.com", numero: "111-222-3333", imageUrl: "person.circle.fill"),
        Usuario(id: UUID(), nome: "Bob Johnson", email: "bob2@example.com", numero: "222-333-4444", imageUrl: "person.fill"),
        Usuario(id: UUID(), nome: "Carol Wilson", email: "carol2@example.com", numero: "333-444-5555", imageUrl: "person.crop.circle"),
        Usuario(id: UUID(), nome: "David Brown", email: "david2@example.com", numero: "444-555-6666", imageUrl: "person.2.fill"),
        Usuario(id: UUID(), nome: "Eve Taylor", email: "eve2@example.com", numero: "555-666-7777", imageUrl: "person.3.fill")
    ]
    
    var searchResults: [Usuario] {
        
        //print("searchResults:\(searchText)")
        
        if searchText.isEmpty {
            return []
        } else {
            return usuariosFicticios.filter {
                return $0.nome.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Spacer(minLength: 1)
                
                if let usuario = _usuario {
                    
                    List {
                        HStack {
                            Image(systemName: usuario.imageUrl)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 64, height: 64)
                                .foregroundColor(Color(uiColor: .label))
                            
                            VStack(alignment: .leading) {
                                Text(usuario.nome)
                                    .font(.headline)
                                    .foregroundColor(Color(uiColor: .label))
                                    
                                Text(usuario.email)
                                    .font(.caption)
                                    .foregroundColor(Color(uiColor: .secondaryLabel))
                                
                                Text(usuario.numero)
                                    .font(.caption)
                                    .foregroundColor(Color(uiColor: .secondaryLabel))
                            }
                            .padding(.leading, 10)
                            
                            Spacer()
                        }
                        .listRowBackground(Color(uiColor: .tertiarySystemBackground))
                        
                        Section(header: Text("Informações Mapeamento")) {
                            InformacaoMapeamentoListRow(label: "Tipo de Risco", value: 1)
                            InformacaoMapeamentoListRow(label: "Tipo de Risco", value: 2)
                            InformacaoMapeamentoListRow(label: "Alerta de risco atual", value: 3)
                            
                        }
                        
                        Section(header: Text("Informações Conexão")) {
                            Picker("Tipo de Conexão", selection: $selectedConnectionType) {
                                ForEach(connectionTypes, id: \.self) { type in
                                    Text(type)
                                }
                            }
                            
                        }
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                    Button("Adicionar") {
                        self.isSheetPresented.toggle()
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 18)
                    
                } else {
                    List {}
                        .scrollContentBackground(.hidden)
                    
                }
                
                Spacer()
            }
            .background(Color(uiColor: .secondarySystemBackground))
            
            
            .navigationTitle("Adicionar Conexão")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .searchable(text: $searchText, prompt: "Digite nome do usuario...")
        .searchSuggestions {
            if !searchText.isEmpty, searchText.count > 2 {
                
                ForEach(searchResults, id: \.id) { result in
                    
                    Button(action: {
                        self._usuario = result
                        self.searchText = result.nome
                    }, label: {
                        HStack(spacing: 18) {
                            Image(systemName: result.imageUrl)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 38, height: 38)
                                .foregroundColor(Color(uiColor: .label))
                            
                            Text(result.nome)
                                .font(.system(size: 16))
                                .foregroundColor(Color(uiColor: .label))
                        }
                    })
                    //.searchCompletion(result.nome)
                }
                
            }
        }
        .onSubmit(of: .search, {
            //print("onSubmit")
        })
        .onChange(of: searchText) { value in
            //print("onChange:\(value)")
            if searchText.isEmpty && !isSearching {
               self._usuario = nil
            }
        }
            
    }
}

struct AdicionarConexaoView_Previews: PreviewProvider {
    
    @State static var isModalPresented = false
    static var previews: some View {
        Group {
            AdicionarConexaoView(isSheetPresented: $isModalPresented).environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }())
            
            AdicionarConexaoView(isSheetPresented: $isModalPresented).environmentObject({ () -> AuthenticationManager in
                let envObj = AuthenticationManager()
                envObj.login()
                return envObj
            }()).preferredColorScheme(.dark)
        }
    }
}
