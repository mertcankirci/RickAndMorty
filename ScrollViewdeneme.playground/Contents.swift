//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var scrolledToRight = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(
            GeometryReader { proxy in
                Color.clear.onAppear {
                    let contentWidth = proxy.size.width
                    let scrollViewWidth = UIScreen.main.bounds.width - proxy.safeAreaInsets.leading - proxy.safeAreaInsets.trailing
                    let offsetX = -proxy.frame(in: .global).minX
                    let scrolledToRight = offsetX > contentWidth - scrollViewWidth
                    
                    if scrolledToRight != self.scrolledToRight {
                        DispatchQueue.main.async {
                            self.scrolledToRight = scrolledToRight
                            
                            if scrolledToRight {
                                print("You've reached the end")
                            }
                        }
                    }
                }
            }
        )
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = ContenView()
