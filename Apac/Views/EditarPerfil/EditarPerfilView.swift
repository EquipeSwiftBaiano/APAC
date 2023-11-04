import SwiftUI

struct EditarPerfilListRow2: View {
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

struct EditarPerfilView: View {
    
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
                    EditarPerfilListRow2(value: $nome, label: "Nome")
                    EditarPerfilListRow2(value: $email, label: "Email")
                    EditarPerfilListRow2(value: $numero, label: "Número")
                }
                Section(header: Text("Endereço")) {
                    EditarPerfilListRow2(value: $email, label: "Endereço")
                    EditarPerfilListRow2(value: $email, label: "Bairro")
                    EditarPerfilListRow2(value: $email, label: "CEP")
                    EditarPerfilListRow2(value: $email, label: "Cidade")
                    EditarPerfilListRow2(value: $email, label: "Estado")
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
            Spacer()
        }
        
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle("Editar Perfil")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color(uiColor: .tertiarySystemBackground), for: .navigationBar)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                EditarPerfilView()
            }
            NavigationStack {
                EditarPerfilView().preferredColorScheme(.dark)
            }
        }
    }
}
