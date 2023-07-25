//
//  StarWarsTests.swift
//  StarWarsTests
//
//  Created by Fernando Garay on 24/07/2023.
//

import XCTest
@testable import StarWars

class CharacterListViewModelTests: XCTestCase {
    func testFetchCharactersSuccess() {
        // Given
        let jsonData = """
            {
                "count": 2,
                "next": "https://swapi.dev/api/people/?page=2",
                "previous": null,
                "results": [
                    {
                        "name": "Luke Skywalker",
                        "height": "172",
                        "mass": "77",
                        "hair_color": "blond",
                        "skin_color": "fair",
                        "eye_color": "blue",
                        "gender": "male"
                    },
                    {
                        "name": "Leia Organa",
                        "height": "150",
                        "mass": "49",
                        "hair_color": "brown",
                        "skin_color": "light",
                        "eye_color": "brown",
                        "gender": "female"
                    }
                ]
            }
            """.data(using: .utf8)

        let mockNetworking = MockNetworking(data: jsonData, response: nil, error: nil)
        let viewModel = CharacterListViewModel(networkManager: mockNetworking)

        let expectation = XCTestExpectation(description: "Fetch characters")

        // When
        viewModel.fetchCharacters {
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(viewModel.characters.count, 2)
        XCTAssertEqual(viewModel.characters.first?.name, "Luke Skywalker")
        XCTAssertEqual(viewModel.characters.last?.name, "Leia Organa")
    }

    func testFetchCharactersFailure() {
        // Given
        let mockNetworking = MockNetworking(data: nil, response: nil, error: NSError(domain: "Test", code: 1, userInfo: nil))
        let viewModel = CharacterListViewModel(networkManager: mockNetworking)

        let expectation = XCTestExpectation(description: "Fetch characters")

        // When
        viewModel.fetchCharacters {
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 5)

        XCTAssertTrue(viewModel.characters.isEmpty)
    }
}
