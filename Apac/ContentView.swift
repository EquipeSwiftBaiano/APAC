import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float = 0
    @State private var showingLoginScreen = false

    var body: some View {
        NavigationView { // Adicione a NavigationView aqui
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 100, height: 100)
                       

                    Text("APAC")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, -25)

                    Text("Login")
                        .font(.title)
                        .foregroundColor(.accentColor)
                        .padding()

                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongUsername))

                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongPassword))

                    NavigationLink("Login", destination: princiaplSwiftUIView())
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)

                    NavigationLink("Cadastrar", destination: cadastro())
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
