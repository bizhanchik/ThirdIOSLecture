//
//  NetworkClient.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import Foundation

class NetworkClient {
    private var BASE_URL: String = "https://rickandmortyapi.com/api/"
    
    func get<Responce: Decodable>(
        relativePath: String,
    ) async throws -> Responce{
        guard
            let url = URL(string: BASE_URL + relativePath)
        else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let responce = try JSONDecoder().decode(Responce.self, from: data)
        return responce
    }
}
