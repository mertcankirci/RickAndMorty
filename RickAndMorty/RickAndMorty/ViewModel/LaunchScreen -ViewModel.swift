//
//  LaunchScreen -ViewModel.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

enum LaunchScreenPhase {
    case first
    case second
    case completed
}

extension LaunchScreenView {
    @MainActor final class LaunchScreenManager: ObservableObject {
        @Published private(set) var state: LaunchScreenPhase = .first
        
        
        func dismiss() {
            
            self.state = .second
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.state = .completed
            }
            
        }
        
    }
}
