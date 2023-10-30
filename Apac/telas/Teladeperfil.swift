import SwiftUI

struct TeladePerfil: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("profile_image") // Substitua "profile_image" pelo nome da imagem do perfil
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()

                Text("Nome do Usuário")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Endereço de Email")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Spacer()

                Text("Informações do Perfil")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                Text("Idade: 30 anos")
                    .font(.headline)
                    .padding()

                Text("Localização: Cidade, País")
                    .font(.headline)
                    .padding()

                Spacer()

                NavigationLink(destination: EditProfileView()) {
                    Text("Editar Perfil")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                      
                }
                .padding()
             
            }
            
        }
    }
}

struct TeladePerfil_Previews: PreviewProvider {
    static var previews: some View {
        TeladePerfil()
    }
}

