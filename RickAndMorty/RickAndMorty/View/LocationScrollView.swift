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
    @State var indexSubject = PassthroughSubject<Int, Never>()

    
    
    let worldNames: [RMLocation]
    
    
    var body: some View {
        
        ScrollView(.horizontal) {
        
            LazyHStack(spacing: 34) {
                ForEach(worldNames.indices, id: \.self) { index in
                    Text(worldNames[index].name)
                        .padding()
                        .background(index == viewModel.selectedWorldIndex ? Color(hex: 0x7cf448) : Color(hex: 0x62a4ab))
                        .foregroundColor(.white) //7cf448
                        .cornerRadius(8)
                        .scaleEffect(index == viewModel.selectedWorldIndex ? 1.2 : 1.0)
                        .onAppear(perform: {
                            if viewModel.hasLaunchedOnce {
                                DispatchQueue.global().asyncAfter(deadline: .now() + 3.8) {
                                    viewModel.LoadCharScrollView(worldNames: worldNames, index: 0)
                                }
                                viewModel.hasLaunchedOnce = false
                            }

                        })
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                DispatchQueue.main.async {
                                    viewModel.selectedWorld = worldNames[index].name
                                    viewModel.selectedWorldIndex = index
                                    viewModel.selectedWorldIndex = viewModel.selectedWorldIndex
                                    viewModel.updateFilteredCharacters()
                                }
                            }
                        }
                }
                .background(
                    GeometryReader { proxy in
                        Color.clear.onAppear {
                            viewModel.contentWidth = proxy.size.width
                            viewModel.minX = proxy.frame(in: .global).minX
                            viewModel.scrollViewWidth = UIScreen.screenWidth - proxy.safeAreaInsets.leading - proxy.safeAreaInsets.trailing
                            viewModel.offSetX = -viewModel.minX
                            viewModel.scrolledToRight = abs(viewModel.offSetX) > 2*viewModel.contentWidth - viewModel.scrollViewWidth
                        }
                    }
                    )
                
                if viewModel.scrolledToRight {
                    Spacer()
                    ProgressView() 
                        .onAppear {
                            DispatchQueue.main.async {
                                viewModel.page += 1
                                viewModel.loadNextPage(page: viewModel.page)
                            }
                        }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

