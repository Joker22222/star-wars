//
//  SwiftUIView.swift
//  StarWars
//
//  Created by Fernando Garay on 25/07/2023.
//

import SwiftUI

//Character Row
struct CharacterRow: View {
    let character: Character
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(character.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Height: \(character.height)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Mass: \(character.mass)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(20)
        .background(Color("PrimaryColor").opacity(0.2))
        .cornerRadius(10)
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character(name: "Luke Skywalker", height: "172", mass: "77", hairColor: "blond", skinColor: "fair", eyeColor: "blue", gender: "male"))
    }
}
