//
//  User.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation

struct Usuario: Identifiable {
    
    var id: UUID
    var username: String
    var nome: String
    var email: String
    var numero: String
    var imageUrl: String
    var endereco: Endereco
    var parentes: [Usuario]
    var vizinhos: [Usuario]

    init() {
        self.id = UUID()
        self.username = ""
        self.nome = ""
        self.email = ""
        self.numero = ""
        self.imageUrl = ""
        self.endereco = Endereco()
        self.parentes = []
        self.vizinhos = []
    }

    init(id: UUID, nome: String, email: String, numero: String, imageUrl: String) {
        self.id = id
        self.username = ""
        self.nome = nome
        self.email = email
        self.numero = numero
        self.imageUrl = imageUrl
        self.endereco = Endereco()
        self.parentes = []
        self.vizinhos = []
    }

    init(id: UUID, nome: String, email: String, numero: String, imageUrl: String, parentes: [Usuario], vizinhos: [Usuario]) {
        self.id = id
        self.username = ""
        self.nome = nome
        self.email = email
        self.numero = numero
        self.imageUrl = imageUrl
        self.endereco = Endereco()
        self.parentes = parentes
        self.vizinhos = vizinhos
    }
    
}
