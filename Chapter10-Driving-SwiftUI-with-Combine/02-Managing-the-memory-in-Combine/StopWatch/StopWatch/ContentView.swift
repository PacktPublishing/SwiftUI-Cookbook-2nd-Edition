//
//  ContentView.swift
//  StopWatch
//
//  Created by Giordano Scalzo on 28/07/2021.
//

import SwiftUI
import Combine

class StopWatchTimer: ObservableObject {
    @Published
    var deciseconds: Int = 0
    @Published
    var seconds: Int = 0
    @Published
    var minutes: Int = 0
    @Published
    var started = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func start() {
        deciseconds = 0
        seconds = 0
        minutes = 0
        
        cancellableSet.store {
            Timer.publish(every: 0.1, on: RunLoop.main, in: .default)
                .autoconnect()
                .sink { _ in
                    self.deciseconds = (self.deciseconds + 1)%10
            }
            Timer.publish(every: 1.0, on: RunLoop.main, in: .default)
                .autoconnect()
                .sink { _ in
                    self.seconds = (self.seconds + 1)%60
            }
            Timer.publish(every: 60.0, on: RunLoop.main, in: .default)
                .autoconnect()
                .sink { _ in
                    self.minutes = (self.minutes + 1)%60
            }
        }
        started = true
    }
    
    func stop() {
        cancellableSet = []
        started = false
    }
}

typealias CancellableSet = Set<AnyCancellable>
extension CancellableSet {
    mutating func store(@CancellableBuilder _ cancellables: () -> [AnyCancellable]) {
        formUnion(cancellables())
    }
    
    @resultBuilder
    struct CancellableBuilder {
        static func buildBlock(_ cancellables: AnyCancellable...) -> [AnyCancellable] {
            return cancellables
        }
    }
    
}

extension Int {
    var formatted: String {
        String(format: "%02d", self)
    }
}

struct ContentView: View {
    @StateObject
    private var timer = StopWatchTimer()
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 0) {
                Text("\(timer.minutes.formatted)")
                    .font(.system(size: 80))
                    .frame(width: 100)
                Text(":")
                    .font(.system(size: 80))
                Text("\(timer.seconds.formatted)")
                    .font(.system(size: 80))
                    .frame(width: 100)
                Text(":")
                    .font(.system(size: 80))
                Text("\(timer.deciseconds.formatted)")
                    .font(.system(size: 80))
                    .frame(width: 100)
            }
            Button {
                if timer.started {
                    timer.stop()
                } else {
                    timer.start()
                }
            } label: {
                Text(timer.started ? "Stop" : "Start")
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .frame(width: 100)
                    .background(timer.started ? Color.red : Color.green)
                    .cornerRadius(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
