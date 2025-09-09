//
//  HomeNetworkingService.swift
//  Vollmed
//
//  Created by ALURA on 07/10/23.
// Last Modify by Thirteena on 23/08/25.
//

import Foundation


protocol HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError>
}

struct HomeNetworkingService: HTTPClient, HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getAllSpecialists, responseModel: [Specialist].self)
    }
}
