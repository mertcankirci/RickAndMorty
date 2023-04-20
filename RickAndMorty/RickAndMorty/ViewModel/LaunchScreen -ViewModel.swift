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
    @Published fileprivate(set) var state: LaunchScreenPhase = .first
    @Published var showLaunchScreen: Bool = true
    @AppStorage("firstLaunch") var isFirstLaunch: Bool = true
        
        
        func dismiss() {
        
            self.state = .second
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.state = .completed
                self.showLaunchScreen = false
            }
            
        }
        
        func greeting() -> String {
            if isFirstLaunch {
                isFirstLaunch = false
                return "Welcome!"
            } else {
                return "Hello!"
            }
        }
        
    }
}
