import SwiftUI

struct EditProfileView: View {
    @State private var editedName = ""
    @State private var editedEmail = ""
    @State private var editedAge = ""
    @State private var editedLocation = ""

    var body: some View {
        VStack {


            TextField("Nome", text: $editedName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Endereço de Email", text: $editedEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Idade", text: $editedAge)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Localização", text: $editedLocation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // Implemente a lógica de salvar as alterações aqui
            }) {
                Text("Salvar Alterações")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Editar Perfil")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
