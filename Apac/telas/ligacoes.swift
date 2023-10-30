import SwiftUI
import UIKit

struct Contact: Identifiable {
    var id = UUID() // Você pode usar um UUID como identificador único
    var name: String
    var phoneNumber: String
}


struct ligacoes: View {
    var body: some View {
        NavigationView {
            List(emergencyContacts) { contact in
                HStack {
                    Text(contact.name)
                    Spacer()
                    Text(contact.phoneNumber)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            if let phoneURL = URL(string: "tel://\(contact.phoneNumber)") {
                                UIApplication.shared.open(phoneURL)
                            }
                        }
                }
            }
            
        }
    }
}

struct ligacoes_Previews: PreviewProvider {
    static var previews: some View {
        ligacoes()
    }
}

// Exemplo de contatos de emergência (substitua por sua própria matriz de contatos)
let emergencyContacts: [Contact] = [
    Contact(name: "Emergência Médica", phoneNumber: "911"),
    Contact(name: "Bombeiros", phoneNumber: "112"),
    Contact(name: "Polícia", phoneNumber: "110")
]
