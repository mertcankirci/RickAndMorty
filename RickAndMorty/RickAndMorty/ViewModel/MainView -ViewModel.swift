//
//  MainView -ViewModel.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

extension MainView {
    @MainActor final class MainViewModel: ObservableObject {
        
        @Published var characterList: [RMCharacter] = []
        @Published var locationList: [RMLocation] = []
        @Published var filteredLocationList: [RMLocation] = []
        @Published var selectedWorld : String = "Earh C-137"
        @Published var filteredCharList: [RMCharacter] = []
        @Published var selectedWorldIndex : Int = 0
        @Published var filteredCharIdList: [String] = []
        var selectedWorldIndexPublisher: Published<Int>.Publisher { $selectedWorldIndex }
        @Published  var hasLaunchedOnce = true
        @Published  var page : Int = 1
        @Published  var scrollViewWidth: CGFloat = 0.0
        @Published  var contentWidth: CGFloat = .zero
        @Published  var minX : CGFloat = 0.0
        @Published  var offSetX: CGFloat = 0.0
        @Published  var scrolledToRight : Bool = false
        
        
        

        func fetchSingleCharacter(id: String) {
            
            let request = RMRequest(endpoint: .character,
                        pathComponents: [id])
            RMService.shared.execute(request, expecting: RMCharacter.self) { results in
                switch results {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.filteredCharList.append(success)
                    }
                    
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
        
        func LoadCharScrollView(worldNames: [RMLocation], index: Int) {
            DispatchQueue.main.async {
                self.selectedWorld = worldNames[index].name
                self.selectedWorldIndex = index
                self.updateFilteredCharacters()
            }
        }

        func updateFilteredCharacters() {
            
            DispatchQueue.main.async {
                self.filteredCharList = []
            }
            
            filteredLocationList = locationList.filter { $0.name == selectedWorld}
            filteredLocationList.forEach { location in
                location.residents.forEach { urlString in
                    DispatchQueue.main.async {
                        guard let url = URL(string: urlString) else { return }
                        let path = url.path
                        let components = path.components(separatedBy: "/")
                        guard let id = components.last else { return }
                        self.fetchSingleCharacter(id: id)
                    }
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
        
        func loadNextPage(page: Int) {
            RMService.shared.execute(RMRequest(endpoint: .location, queryParameters: [URLQueryItem(name: "page", value: "\(page)")]), expecting: RMGetAllLocationResponse.self) { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        success.results.forEach { newLoc in
                            self.locationList.append(newLoc)
                        }
                        
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
