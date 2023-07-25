//
//  Character.swift
//  StarWars
//
//  Created by Fernando Garay on 25/07/2023.
//

import Foundation

// Character Model
struct Character: Codable, Identifiable, Equatable  {
    let id: UUID = UUID()
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass, hairColor = "hair_color", skinColor = "skin_color", eyeColor = "eye_color", gender
    }
    // Implement Equatable conformance based on the id property
    static func ==(lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}
