//
//  ContentView.swift
//  StarWars
//
//  Created by Fernando Garay on 24/07/2023.
//

import SwiftUI

//Character List
struct CharacterListView: View {
    @ObservedObject private var viewModel = CharacterListViewModel()
    @State private var isAnimating = false
    public var characterMock : [Character]?
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailsView(character: character)) {
                            CharacterRow(character: character)
                        }
                        .listRowSeparator(.hidden)
                        .onAppear {
                            //  Use Mock Data to load the preview faster
                            if characterMock == nil {
                                viewModel.fetchCharacters {}
                            } else {
                                viewModel.characters = characterMock!
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Star Wars Characters")
                .navigationBarTitleDisplayMode(.large)
                .toolbarBackground(
                    Color("PrimaryColor"),
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.0)) {
                        isAnimating = true
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.74)
                        .frame(width: 100, height: 100)
                }
            }
            .onAppear {
                //  Use Mock Data to load the preview faster
                if characterMock == nil {
                    viewModel.fetchCharacters {}
                } else {
                    viewModel.characters = characterMock!
                }
            }
        }.tint(.black)
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characterMock: [Character(name: "Luke Skywalker", height: "172", mass: "77", hairColor: "blond", skinColor: "fair", eyeColor: "blue", gender: "male"), Character(name: "Luke Skywalker", height: "172", mass: "77", hairColor: "blond", skinColor: "fair", eyeColor: "blue", gender: "male")])
    }
}
