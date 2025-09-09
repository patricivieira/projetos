//
//  AuthenticationService.swift
//  Vollmed
//
//  Created by ALURA on 07/10/23.
// Last Modify by Thirteena on 23/08/25.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError>
}

struct AuthenticationService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.logout, responseModel: nil)
    }
}
