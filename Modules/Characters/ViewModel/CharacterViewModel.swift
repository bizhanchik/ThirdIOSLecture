//
//  CharacterViewModel.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import Foundation

@MainActor
class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var page: Int = 1
    
    private let service = CharacterService()
    
    func fetchCharacters() async {
        do {
            service.page = page
            characters = try await service.get()
        } catch {
            print("Ошибка при загрузке страницы \(page): \(error)")
        }
    }
    
    func goToNextPage() {
        if page < 42 {
            page += 1
            Task { await fetchCharacters() }
        }
    }
    
    func goToPreviousPage() {
        if page > 1 {
            page -= 1
            Task { await fetchCharacters() }
        }
    }
}
