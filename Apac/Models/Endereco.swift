//
//  Endereco.swift
//  apac
//
//  Created by user on 17/11/23.
//

import Foundation

struct Endereco: Identifiable {
    
    var id: UUID
    var logradouro: String
    var bairro: String
    var cep: String
    var cidade: String
    var estado: String
    

    init() {
        self.id = UUID()
        self.logradouro = ""
        self.bairro = ""
        self.cep = ""
        self.cidade = ""
        self.estado = ""
    }
}
