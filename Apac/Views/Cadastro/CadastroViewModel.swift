//
//  CadastroViewModel.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation

class CadastroViewModel: ObservableObject {

    let etapas = ["Informações Pessoais", "Informações de Enderço", "Informações de Acesso"]
    
    private var isUltimaEtapa: Bool = false
    
    private var authenticationManager: AuthenticationManager?
    
    @Published var usuario: Usuario = Usuario()
    
    @Published var senha: String = ""
    
    @Published var confirmarSenha: String = ""
        
    @Published var etapaAtual: Int = 0
    
    @Published var mensagemBotao: String = "Proxima Etapa"
    
    @Published var activeColorOffset: CGFloat = 0
    
    @Published var inactiveColorOffset: CGFloat = 0.5
    
    func proximaEtapa() {
        
        if(self.isUltimaEtapa) {
            self.cadastrar()
        } else {
            self.incrementarEtapa();
        }
        
    }
    
    private func incrementarEtapa () {
            
        let countList = etapas.count - 1
        
        if(self.etapaAtual < countList) {
            
            self.etapaAtual += 1
            self.activeColorOffset += 0.5
            self.inactiveColorOffset += 0.5
            
        }
        
        if(self.etapaAtual  == countList) {
            self.mensagemBotao = "Cadastrar"
            self.isUltimaEtapa = true
        }
    }
    
    func cadastrar() {
        
        guard let authenticationManager = self.authenticationManager else {
            return
        }
        
        print("Cadastrar Usuario")
        
        print(usuario)
        
        authenticationManager.login()
    }
    
    func setup(_ authenticationManager: AuthenticationManager) {
        
        self.authenticationManager = authenticationManager
        
        self.clear()
    }
    
    func clear() {
        
        self.etapaAtual = 0
        
        self.mensagemBotao = "Proxima Etapa"
        
        self.activeColorOffset = 0
        
        self.inactiveColorOffset = 0.5
        
        self.isUltimaEtapa = false
        
        self.usuario = Usuario()
        
        self.senha = ""
        
        self.confirmarSenha = ""
    }
}
