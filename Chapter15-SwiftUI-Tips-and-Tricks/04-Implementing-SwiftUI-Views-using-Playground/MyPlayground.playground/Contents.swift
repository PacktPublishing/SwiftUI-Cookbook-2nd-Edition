import PlaygroundSupport
import SwiftUI

extension Text {
    func customize(_ color: Color) -> some View {
        self
            .font(.system(.title))
            .frame(width: 300, height: 150)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(10)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("SwiftUI")
                .customize(.yellow)
            Text("in a")
                .customize(.green)
            Text("Playground!")
                .customize(.red)
        }

    }
}
let viewController = UIHostingController(
                    rootView: ContentView())

PlaygroundPage.current.liveView = viewController
