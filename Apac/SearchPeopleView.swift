import SwiftUI

enum SearchTypee {
    case friends
    case emergencyInstructions
}

struct Personn {
    var name: String
    
}

struct SeearchPeopleView: View {
    let type: SearchTypee
    @State private var searchText: String = ""


   
    let people: [Personn] = [
        Personn(name: "Amigo 1"),
        Personn(name: "Amigo 2"),
        Personn(name: "Parente 1"),
        Personn(name: "Parente 2"),
        Personn(name: "Conhecido 1"),
        Personn(name: "Conhecido 2"),
    ]

    var filteredPeople: [Personn] {
        return people.filter { personn in
            return personn.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack {
            Text(type == .friends ? "Procurar Amigos/Parentes" : "Instruções de Emergência")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            TextField("Pesquisar", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(filteredPeople, id: \.name) { personn in
                Text(personn.name)
              
            }
            .navigationTitle(searchTypeTitle(type))
        }
    }

    func searchTypeTitle(_ type: SearchTypee) -> String {
        switch type {
        case .friends:
            return "Amigos/Parentes Encontrados"
        case .emergencyInstructions:
            return "Instruções de Emergência Encontradas"
        }
    }
}

struct SearchPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPeopleView(type: .friends)
    }
}
