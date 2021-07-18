//
//  ContentView.swift
//  LottieInSwiftUI
//
//  Created by Giordano Scalzo on 06/07/2021.
//

import SwiftUI
import Lottie

struct LottieAnimation: UIViewRepresentable {
    private let animationView = AnimationView()
    var animationName = ""
    
    @Binding var play: Bool
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        animationView.animation = Animation.named(animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.scalesLargeContentImage = true
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard play else { return }
        
        animationView.play { _ in
            play = false
        }
    }
}

struct ContentView: View {
    @State
    private var play = false
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            VStack {
                LottieAnimation(animationName: "filling-heart",
                                play: $play)
                    .padding(.horizontal, 30)
                Button {
                    play = true
                } label: {
                    Text("Fill me!")
                        .fontWeight(.heavy)
                        .padding(15)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
