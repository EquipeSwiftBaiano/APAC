import SwiftUI

struct FriendsSearchView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Procurar Amigos, Parentes ou Conhecidos")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                NavigationLink(destination: SearchPeopleView(type: .friends)) {
                    Text("Procurar Amigos/Parentes")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SearchPeopleView(type: .emergencyInstructions)) {
                    Text("Instruções de Emergência")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            
        }
    }
}

enum SearchType {
    case friends
    case emergencyInstructions
}

struct SearchPeopleView: View {
    var type: SearchType

    var body: some View {
        VStack {
            Text(type == .friends ? "Procurar Amigos/Parentes" : "Instruções de Emergência")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            if type == .friends {
                Text("Visualização para procurar amigos/parentes")
            } else {
                Text("Visualização para instruções de emergência")
            }

            Spacer()
        }
        .navigationTitle(type == .friends ? "Amigos/Parentes" : "Emergência")
    }
}

struct FriendsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsSearchView()
    }
}
