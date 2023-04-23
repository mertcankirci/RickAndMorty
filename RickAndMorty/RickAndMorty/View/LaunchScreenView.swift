//
//  LaunchScreenView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @EnvironmentObject var launchScreenManager : LaunchScreenManager
    @State private var firstPhaseisAnimating: Bool = false
    @State private var secondPhaseisAnimating: Bool = false
    @State private var thirdPhaseisAnimating: Bool = false
    private let timer = Timer.publish(every: 0.65,
                                      on: .main,
                                      in: .common).autoconnect()
    
    
    
    var body: some View {
        VStack {
            ZStack {
                Image("purple-cosmos")
                    .resizable()
                    
                VStack{
                    Image("rmLogo")
                        
                        .scaleEffect(firstPhaseisAnimating ? 0.65 : 1)
                        .scaleEffect(secondPhaseisAnimating ? (UIApplication.shared.connectedScenes.first as! UIWindowScene).screen.nativeBounds.size.height/4 : 1)
                        
                    Image("rm-yazi")
                        .scaleEffect(firstPhaseisAnimating ? 0.65 : 1)
                        .scaleEffect(secondPhaseisAnimating ? (UIApplication.shared.connectedScenes.first as! UIWindowScene).screen.nativeBounds.size.height/4 : 1)
                    
                    Text(launchScreenManager.greeting())
                            .foregroundColor(Color(hex: 0x62a4ab))
                            .scaleEffect(firstPhaseisAnimating ? 0.65 : 1)
                            .scaleEffect(secondPhaseisAnimating ? (UIApplication.shared.connectedScenes.first as! UIWindowScene).screen.nativeBounds.size.height/4 : 1)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 40, leading: 8, bottom: 8, trailing: 8))
                }
            }
            .onReceive(timer) { input in
                
                switch launchScreenManager.state {
                case .first:
                    withAnimation(.spring()) {
                        firstPhaseisAnimating.toggle()
                    }
                case .second:
                    withAnimation(.easeInOut(duration: 1)) {
                        secondPhaseisAnimating.toggle()
                    }
                default:
                    break
                }
                
                
                if launchScreenManager.state == .completed {
                    launchScreenManager.showLaunchScreen = false
                }
                
                
            }
            .opacity(secondPhaseisAnimating ? 0 : 1)
        }
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
        
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenView.LaunchScreenManager())
    }
}
