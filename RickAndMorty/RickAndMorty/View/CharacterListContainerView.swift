//
//  CharacterListContainerView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 18.04.2023.
//

import SwiftUI

struct CharacterListContainerView: View {
    var characters: [RMCharacter]
    @EnvironmentObject var viewModel : MainView.MainViewModel
        
        var body: some View {
            VStack {
                ForEach(characters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterListView(character: character)
                    }
                }
            }
            .onChange(of: characters) { _ in
                viewModel.objectWillChange.send()
            }
        }
}

struct CharacterListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListContainerView(characters: [RMCharacter(id: 1, name: "When Wolf", status: RMCharacterStatus.alive, species: "Mythological Creature", type: "Whenwolf", gender: RMCharacterGender.male, origin: RMOrigin(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), location: RMSingleLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/711.jpeg", episode: ["https://rickandmortyapi.com/api/episode/43"], url: "https://rickandmortyapi.com/api/character/711", created: "2021-10-16T16:11:18.457Z"), RMCharacter(id: 1, name: "When Wolf", status: RMCharacterStatus.alive, species: "Mythological Creature", type: "Whenwolf", gender: RMCharacterGender.male, origin: RMOrigin(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), location: RMSingleLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/711.jpeg", episode: ["https://rickandmortyapi.com/api/episode/43"], url: "https://rickandmortyapi.com/api/character/711", created: "2021-10-16T16:11:18.457Z")])
    }
}
