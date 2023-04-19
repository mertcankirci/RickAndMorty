//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 18.04.2023.
//

import SwiftUI

struct CharacterDetailView: View {
    @State var character: RMCharacter
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: CharacterDetailView.CharacterDetailViewModel
    

    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .bold))
                    })
                    .padding(.trailing, 20)
                        Spacer()
                    Text(character.name)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.trailing, 60)
                        Spacer()
                }
                .padding(.bottom,16)
                AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Image(systemName: "person.badge.clock.fill")
                            .resizable()
                            .frame(width: 275, height: 275)
                    }
                    .frame(width: 275, height: 275)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
                VStack(spacing: 5){
                    DetailTextView(title: "Status", value: character.status.rawValue)
                    DetailTextView(title: "Specy", value: character.species)
                        .lineLimit(2)
                    DetailTextView(title: "Gender", value: character.gender.rawValue)
                    DetailTextView(title: "Origin", value: character.origin.name)
                    DetailTextView(title: "Location", value: character.location.name)
                    DetailTextView(title: "Episodes", value: viewModel.findEpisodes(episode: character.episode))
                    DetailTextView(title: "Created at (in API)", value: character.created)
                        .padding(.bottom, 20)
                }
                
                
            }
        }
        
        
    }
}
    
    
    
    struct CharacterDetailView_Previews: PreviewProvider {
        static var previews: some View {
            CharacterDetailView(character: RMCharacter(id: 1, name: "When Wolf", status: RMCharacterStatus.alive, species: "Mythological Creature", type: "Whenwolf", gender: RMCharacterGender.male, origin: RMOrigin(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), location: RMSingleLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/711.jpeg", episode: ["https://rickandmortyapi.com/api/episode/43"], url: "asjdnajsdn", created: "ajksdnkjasndkjasd"))
                .environmentObject(CharacterDetailView.CharacterDetailViewModel())
        }
            
    }
