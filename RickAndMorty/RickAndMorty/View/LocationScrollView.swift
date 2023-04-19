//
//  LocationScrollView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 17.04.2023.
//

import SwiftUI

struct LocationScrollView: View {
    
    @EnvironmentObject var viewModel: MainView.MainViewModel
    @State var selectedWorldIndex : Int = 0
    
    
    let worldNames: [RMLocation]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(worldNames.indices, id: \.self) { index in
                    Text(worldNames[index].name)
                        .padding()
                        .background(index == selectedWorldIndex ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .scaleEffect(index == selectedWorldIndex ? 1.2 : 1.0)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                DispatchQueue.main.async {
                                viewModel.selectedWorld = worldNames[index].name
                                selectedWorldIndex = index
                                viewModel.selectedWorldInex = selectedWorldIndex
                                viewModel.updateFilteredCharacters()
                                
                                
                                    
                                    print(index)
                                    
                                }
                                
                                
                            }
                        }
                    
                }
            }
            .padding()
        }
        
    }
        
}

