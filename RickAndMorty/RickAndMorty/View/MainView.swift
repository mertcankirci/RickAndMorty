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
                        .frame(width: UIScreen.screenWidth, height: 100)
                        .environmentObject(viewModel)
                    CharacterListContainerView(characters: viewModel.filteredCharList)
                        
                        .environmentObject(viewModel)
                }
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                        launchScreenManager.dismiss()
                    }
                    
                }
                .onAppear() {
                    
                    viewModel.fetchCharacters()
                    viewModel.fetchLocation()
                    
                }
            }
            .ignoresSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            
        }

        
        
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
