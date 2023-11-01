//
//  User.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation

struct User: Identifiable {
    var id = UUID() // Você pode usar um UUID como identificador único
    var nome: String
    var email: String
    var numero: String
    var imageUrl: String
    
    var parentes: [User]
    var vizinhos: [User]
}
