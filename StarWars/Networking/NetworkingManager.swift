//
//  NetworkingManager.swift
//  StarWars
//
//  Created by Fernando Garay on 25/07/2023.
//

import Foundation
import Combine

//Networking Protocol
protocol Networking {
    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

//Networking Manager
class NetworkManager: Networking {
    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
