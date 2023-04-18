//
//  MainView -ViewModel.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

//"https://rickandmortyapi.com/api/location/1

extension MainView {
    @MainActor final class MainViewModel: ObservableObject {
        
        @Published var characterList: [RMCharacter] = []
        @Published var locationList: [RMLocation] = []
        @Published var filteredLocationList: [RMLocation] = []
        @Published var selectedWorld : String = ""
        @Published var filteredCharList: [RMCharacter] = []
        @Published var selectedWorldInex : Int = 0
        @Published var filteredCharIdList: [String] = []

        
        func fetchSingleCharacter(id: String) {
            let request = RMRequest(endpoint: .character,
                        pathComponents: [id])
            RMService.shared.execute(request, expecting: RMCharacter.self) { results in
                switch results {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.filteredCharList.append(success)
                    }
                    print("--------------------")
                    print(self.filteredCharList)
                    
                case .failure(let failure):
                print(String(describing: failure))
                }
            }
        }
        
        
        func fetchCharacters() {
            
            RMService.shared.execute(.listOfCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        success.results.forEach { char in
                            self.characterList.append(char)
                        }
                        
                        
                    }
                    
                    
                    
                case .failure(let failure):
                    print(String(describing: failure))
                }
            }
        }
        
        func updateFilteredCharacters() {
            self.filteredCharList = []
            filteredLocationList = locationList.filter { $0.name == selectedWorld}
            filteredLocationList.forEach { location in
                location.residents.forEach { urlString in
                    guard let url = URL(string: urlString) else { return }
                    let path = url.path
                    let components = path.components(separatedBy: "/")
                    guard let id = components.last else { return }
                    fetchSingleCharacter(id: id)
                    
                }
            }
            
            
        }

        
        func fetchLocation() {
            
            RMService.shared.execute(.listOfLocationsRequest, expecting: RMGetAllLocationResponse.self) { result in
             switch result {
             case .success(let success):
                 DispatchQueue.main.async {
                     success.results.forEach { char in
                         self.locationList.append(char)
                     }
                     //print(self.locationList)
                 }
                 
                 
                 

             case .failure(let failure):
             print(String(describing: failure))
             }
             }
             
             
        }
        
    }
}

/*
 func fetchCharacterDetails() {
     // Fetch character data for the selected location
     guard let location = selectedLocation else { return }
     let residentURLs = location.residents
     filteredCharList = []
     
     // Fetch character data for each resident URL using RMService
     for url in residentURLs {
         guard let url = URL(string: url) else { continue }
         
         let request = RMRequest(endpoint: .character)
         RMService.shared.execute(request, expecting: RMCharacter.self) { result in
             switch result {
             case .success(let character):
                 DispatchQueue.main.async {
                     print(character)
                     
                 }
                 print(self.filteredCharList)
             case .failure(let error):
                 print("Error fetching character data: \(error.localizedDescription)")
             }
         }
     }
 }
 */
