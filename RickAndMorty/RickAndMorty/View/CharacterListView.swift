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
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                }
                .frame(width: 120, height: 100)
                .cornerRadius(20)
            
                
            if character.gender == RMCharacterGender.male {
                Image("male-sign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.leading, UIScreen.screenHeight/40)
            }
            
            else if character.gender == RMCharacterGender.female {
                Image("female-sign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.leading, UIScreen.screenHeight/40)
            }
            
            else if character.gender == RMCharacterGender.unknown {
                Image("unknown-sign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.leading, UIScreen.screenHeight/40)
            }
            
            else {
                Image("genderless-sign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.leading, UIScreen.screenHeight/40)
            }
                
                ZStack {
                    
                    if character.gender.rawValue == "Male" {
                        Color(hex: 0xa6027)
                    }
                    else if character.gender.rawValue == "Female" {
                        Color(hex: 0xa6f282)
                    }
                    else if character.gender.rawValue == "Genderless" {
                        Color(hex: 0xe9575)
                    }
                    else {
                        Color(hex: 0x313d29)
                    }
                        
                    Text("\(character.name)")
                        .foregroundColor(.black)
                        .padding()
                        
                }
                .frame(width: 120, height: 100)
                .cornerRadius(20)
                .padding(.leading, UIScreen.screenHeight/40)
            
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
