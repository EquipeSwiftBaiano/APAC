//
//  AuthenticationProtocol.swift
//  apac
//
//  Created by user on 29/10/23.
//

import Foundation

protocol AuthenticationProtocol {
    func login(_ email: String, _ password: String) async -> (isError: Bool, message: String)?
}
