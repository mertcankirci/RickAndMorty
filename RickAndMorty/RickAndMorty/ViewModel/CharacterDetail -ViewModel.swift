//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 18.04.2023.
//

import SwiftUI

extension CharacterDetailView {
    @MainActor final class CharacterDetailViewModel: ObservableObject {
        
        
        public func findEpisodes(episode: [String]) -> String {
            var numbers: [Int] = []
            for url in episode {
                numbers+=url.numbersAtEnd()
            }
            
           let string = numbers.map(String.init).joined(separator: ", ")
            return string
            
        }
        
    }
}
