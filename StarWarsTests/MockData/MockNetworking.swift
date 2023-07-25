//
//  MockNetworking.swift
//  StarWars
//
//  Created by Fernando Garay on 25/07/2023.
//

import Foundation

//Mock Networking Class
class MockNetworking: Networking {
    let data: Data?
    let response: URLResponse?
    let error: Error?

    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }

    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, response, error)
    }
}
