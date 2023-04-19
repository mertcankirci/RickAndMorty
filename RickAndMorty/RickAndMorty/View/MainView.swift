//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//
import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var launchScreenManager : LaunchScreenView.LaunchScreenManager
    @StateObject var viewModel = MainViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Image("rm-yazi")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.top, 50)
                    LocationScrollView(worldNames: viewModel.locationList)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/10)
                        .environmentObject(viewModel)
                    VStack(alignment: .trailing) {
                        
                        VStack {
                            ForEach(viewModel.filteredCharList) { character in
                                NavigationLink(destination: CharacterDetailView(character: character).navigationBarBackButtonHidden(true)
                                    .environmentObject(CharacterDetailView.CharacterDetailViewModel())) {
                                    CharacterListView(character: character)
                                }
                            }
                            
                        }
                        .onChange(of: viewModel.filteredCharList) { _ in
                            viewModel.objectWillChange.send()
                            removeDuplicates()
                        }
                    }
                }
                
                .onAppear {
                    viewModel.fetchCharacters()
                    viewModel.fetchLocation()
    
                        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                            launchScreenManager.dismiss()

                        }
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0xccdac5))
        }
    }
    
    func removeDuplicates() {
        var uniqueChars: [RMCharacter] = []
        for char in viewModel.filteredCharList {
            if !uniqueChars.contains(where: { $0.id == char.id }) {
                uniqueChars.append(char)
            }
        }
        viewModel.filteredCharList = uniqueChars
    }
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LaunchScreenView.LaunchScreenManager())
    }
}
/*
 .onAppear(perform: {
 RMService.shared.execute(.listOfCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
 switch result {
 case .success(let success):
 print("Total" + String(success.info.count))
 print("Page result" + String(success.results.count))
 
 case .failure(let failure):
 print(String(describing: failure))
 }
 }
 })
 */
