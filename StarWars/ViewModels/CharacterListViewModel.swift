//
//  CharacterListViewModel.swift
//  StarWars
//
//  Created by Fernando Garay on 25/07/2023.
//

import Foundation

//Result
struct CharacterResult: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Character]
}

//Character List View Model
class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    private var nextURL: URL? = URL(string: "https://swapi.dev/api/people/")
    private let networkManager: Networking
    
    init(networkManager: Networking = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchCharacters(completion: @escaping () -> Void) {
        isLoading = true
        guard let url = nextURL else { return }
        networkManager.fetchData(from: url) { [weak self] data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    self?.characters = [] // Clear characters in case of an error.
                    completion()
                    self?.isLoading = false
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let charactersResult = try decoder.decode(CharacterResult.self, from: data)
                DispatchQueue.main.async {
                    self?.characters.append(contentsOf: charactersResult.results)
                    self?.nextURL = charactersResult.next
                    completion()
                    self?.isLoading = false
                }
            } catch {
                print("Error decoding characters:", error)
                DispatchQueue.main.async {
                    self?.characters = [] // Clear characters in case of a decoding error.
                    completion()
                    self?.isLoading = false
                }
            }
        }
    }
}
