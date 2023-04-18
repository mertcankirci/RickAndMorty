//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct CharacterListView: View {
    @EnvironmentObject var viewModel : MainView.MainViewModel
    @State var character: RMCharacter
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "person.badge.clock.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .frame(width: 150, height: 150)
                .cornerRadius(20)
            
                
            Image("male-sign")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.leading, UIScreen.screenHeight/20)
                
                ZStack {
                    
                    if character.gender.rawValue == "Male" {
                        Color.blue
                    }
                    else if character.gender.rawValue == "Female" {
                        Color.pink
                    }
                    else if character.gender.rawValue == "Genderless" {
                        Color.green
                    }
                    else {
                        Color.gray
                    }
                        
                    
                    Text("\(character.name)")
                        .padding(.trailing, 20)
                        
                }
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .padding(.leading, UIScreen.screenHeight/20)
            
            
        }
        .frame(width: UIScreen.screenWidth)
        
        .cornerRadius(20)
            
    }
}

struct CharacterListView_Previews: PreviewProvider {
    
    
    static var previews: some View {

        CharacterListView(character: RMCharacter(id: 1, name: "When Wolf", status: RMCharacterStatus.alive, species: "Mythological Creature", type: "Whenwolf", gender: RMCharacterGender.male, origin: RMOrigin(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), location: RMSingleLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/711.jpeg", episode: ["https://rickandmortyapi.com/api/episode/43"], url: "asjdnajsdn", created: "ajksdnkjasndkjasd"))
        
    }
}
