import SwiftUI

struct alerta: View {
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var selectedOption = 0
    
    var body: some View {
        Text("Alert")
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
                )
            }
    }
}

struct alerta_Previews: PreviewProvider {
    static var previews: some View {
        alerta()
    }
}
