//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    @StateObject var launchScreenManager = LaunchScreenView.LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
                MainView()
                
                if launchScreenManager.state != .completed {
                    LaunchScreenView()
                }
                
            }
            .environmentObject(LaunchScreenView.LaunchScreenManager())
        }
    }
}
