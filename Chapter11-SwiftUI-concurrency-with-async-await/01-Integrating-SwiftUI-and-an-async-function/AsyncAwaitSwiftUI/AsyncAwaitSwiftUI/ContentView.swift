//
//  ContentView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Giordano Scalzo on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    let service = Service()
    @State var value: String = ""
    @State var counter = 0
    
    var body: some View {
        VStack {
            Text(value)
            Text("\(counter)")
            Button {
                counter += 1
            } label: {
                Text("increment")
            }
            .buttonStyle(.bordered)
        }
        .onAppear {
            value = await service.fetchResult()
        }
    }
}

class Service {
    
    func fetchResult() async -> String {
        await sleep(seconds: 5)
        return "Result"
    }
    
    private func sleep(seconds: Int) async {
        try? await Task.sleep(nanoseconds:
                                UInt64(seconds * 1000000000))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
