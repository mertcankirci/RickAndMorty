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
    @State private var showLaunchscreen : Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
                MainView()
                
                if launchScreenManager.showLaunchScreen == true {
                    LaunchScreenView()
                       // .transition(.move(edge: .leading))
                }
                
            }
            .environmentObject(launchScreenManager)
        }
    }
}
