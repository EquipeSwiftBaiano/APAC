//
//  TabsEnum.swift
//  apac
//
//  Created by user on 30/10/23.
//

import Foundation

enum TabsEnum {
    case home
    case conexoes
    case alerta
    case telefonesUteis
    case perfil
}

extension TabsEnum {
    func toString() -> String {
        switch self {
        case .home:
            return "Home"
        case .conexoes:
            return "Conexões"
        case .alerta:
            return "Home"
        case .telefonesUteis:
            return "Telefones úteis"
        case .perfil:
            return "Perfil"
        }
    }
}
