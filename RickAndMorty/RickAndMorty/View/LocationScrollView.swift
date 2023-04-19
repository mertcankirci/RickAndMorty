//
//  LocationScrollView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 17.04.2023.
//

import SwiftUI
import Combine

struct LocationScrollView: View {
    
    @EnvironmentObject var viewModel: MainView.MainViewModel
    @State var selectedWorldIndex : Int = 0
    @State var indexSubject = PassthroughSubject<Int, Never>()
    @State private var hasLaunchedOnce = true
    
    
    let worldNames: [RMLocation]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 28) {
                ForEach(worldNames.indices, id: \.self) { index in
                    Text(worldNames[index].name)
                        .padding()
                        .background(index == selectedWorldIndex ? Color(hex: 0x7cf448) : Color(hex: 0x62a4ab))
                        .foregroundColor(.white) 
                        .cornerRadius(8)
                        .scaleEffect(index == selectedWorldIndex ? 1.2 : 1.0)
                        .onAppear(perform: {
                            if hasLaunchedOnce {
                                DispatchQueue.global().asyncAfter(deadline: .now() + 3.8) {
                                    viewModel.LoadCharScrollView(worldNames: worldNames, index: 0)
                                }
                                hasLaunchedOnce = false
                            }
                        })
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                DispatchQueue.main.async {
                                    viewModel.selectedWorld = worldNames[index].name
                                    selectedWorldIndex = index
                                    viewModel.selectedWorldIndex = selectedWorldIndex
                                    viewModel.updateFilteredCharacters()
                                    
                                    
                                    
                                    print(index)
                                    
                                }
                                
                                
                            }
                        }
                    
                }
            }
            .padding()
        }
        
        //.background(Color(hex: 0xd8bcb5))
        
        
    }
        
    
}
