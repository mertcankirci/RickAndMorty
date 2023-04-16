//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//
import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var launchScreenManager : LaunchScreenView.LaunchScreenManager
    
    var body: some View {
        
        Text("Hello")
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                    launchScreenManager.dismiss()
                }
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
