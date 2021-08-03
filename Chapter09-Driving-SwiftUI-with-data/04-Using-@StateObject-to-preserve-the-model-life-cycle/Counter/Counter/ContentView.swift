//
//  ContentView.swift
//  Counter
//
//  Created by Giordano Scalzo on 28/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State var refreshedAt: Date = Date()
    var body: some View {
        VStack(spacing:12) {
            Text("Refresh at ") +
            Text(refreshedAt.formatted(date: .omitted, time: .standard) )
            CounterView()
            Button {
                refreshedAt = Date()
            } label: {
                Text("Refresh")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
            }
            
        }
    }
}

struct CounterView: View {
    @ObservedObject var counter = Counter()
    //    @StateObject var counter = Counter()
    var body: some View {
        VStack(spacing: 12) {
            Text("\(counter.value)")
            HStack(spacing: 12) {
                Button {
                    counter.dec()
                } label: {
                    Text("-")
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                }
                Button {
                    counter.inc()
                } label: {
                    Text("+")
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                }
                
            }
        }
    }
}

class Counter: ObservableObject {
    @Published var value: Int = 0
    
    func inc() {
        value += 1
    }
    
    func dec() {
        value -= 1
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
