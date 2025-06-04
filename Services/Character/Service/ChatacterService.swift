//
//  ChatacterService.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import Foundation

class CharacterService: ObservableObject {
    @Published var page = 1
    private let networkClient = NetworkClient()
    
//    func get() async throws -> [Character] {
//        try await networkClient.get(relativePath: "/character")
//    }
    
    func get() async throws -> [Character] {
        let response: CharacterResponse = try await networkClient.get(relativePath: "character?page=\(page)")
        return response.results
    }

}

struct CharacterResponse: Decodable {
    let results: [Character]
}
