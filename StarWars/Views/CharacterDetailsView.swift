//
//  CharacterDetailsView.swift
//  StarWars
//
//  Created by Fernando Garay on 24/07/2023.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: Character
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack {
                CharacterDetailsRow(title: "Height", value: character.height)
                Spacer()
                CharacterDetailsRow(title: "Mass", value: character.mass)
            }.frame(height: 50)
                .padding(.init(top: 10, leading: 100, bottom: 10, trailing: 100))
            HStack {
                CharacterDetailsRow(title: "Hair Color", value: character.hairColor)
                Spacer()
                CharacterDetailsRow(title: "Skin Color", value: character.skinColor)
            }.frame(height: 50)
                .padding(.init(top: 10, leading: 90, bottom: 10, trailing: 80))
            HStack {
                CharacterDetailsRow(title: "Eye Color", value: character.eyeColor)
                Spacer()
                CharacterDetailsRow(title: "Gender", value: character.gender)
            }.frame(height: 50)
                .padding(.init(top: 10, leading: 91, bottom: 10, trailing: 90))
            Spacer()
        }
        .navigationBarTitle(character.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(
            Color("PrimaryColor"),
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(Color("PrimaryColor").opacity(0.2))
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: Character(name: "Luke Skywalker", height: "172", mass: "77", hairColor: "blond", skinColor: "fair", eyeColor: "blue", gender: "male"))
    }
}
