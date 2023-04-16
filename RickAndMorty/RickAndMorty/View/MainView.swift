//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
        
}
    

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
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
