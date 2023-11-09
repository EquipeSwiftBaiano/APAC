import SwiftUI

struct ProfileListRow: View {
    @Binding var value: String
    let label: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            TextField("", text: $value)
        }
    }
}
struct ProfileView: View {
    
    @State private var nome = "Seu Nome"
    @State private var email = "seu@email.com"
    @State private var numero = "Seu Número"
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 18) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                
                Text("Foto do Perfil")
            }
            .padding(.top)
            Spacer()
            List {
                Section(header: Text("Informações Pessoais")) {
                    ProfileListRow(value: $nome, label: "Nome")
                    ProfileListRow(value: $email, label: "Email")
                    ProfileListRow(value: $numero, label: "Número")
                }
                Section(header: Text("Endereço")) {
                    ProfileListRow(value: $email, label: "Endereço")
                    ProfileListRow(value: $email, label: "Bairro")
                    ProfileListRow(value: $email, label: "CEP")
                    ProfileListRow(value: $email, label: "Cidade")
                    ProfileListRow(value: $email, label: "Estado")
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
            Spacer()
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle("Perfil")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                ProfileView()
            }
            NavigationStack {
                ProfileView().preferredColorScheme(.dark)
            }
        }
    }
}
