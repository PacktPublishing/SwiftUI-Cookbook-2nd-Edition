//
//  ContentView.swift
//  DebuggingCombine
//
//  Created by Giordano Scalzo on 04/08/2021.
//

import SwiftUI
import Combine

class ReactiveObject {
    private var cancellableSet: Set<AnyCancellable> = []
    
    func handleEvents() {
        let subject = PassthroughSubject<String, Never>()
        subject
            .handleEvents(receiveSubscription: {
                print("Receive subscription: \($0)")
            }, receiveOutput: {
                print("Received output: \($0)")
            }, receiveCompletion: {
                print("Receive completion: \($0)")
            }, receiveCancel: {
                print("Receive cancel")
            }, receiveRequest: {
                print("Receive request: \($0)")
            })
            .sink { _ in }
        .store(in: &cancellableSet)
        
        subject.send("New Message!")
    }
    
    func printDebug() {
        let subject = PassthroughSubject<String, Never>()
        subject
            .print("Print").sink { _ in }
        .store(in: &cancellableSet)
        
        subject.send("New Message!")
    }
    
    func breakPoint() {
        (1..<10).publisher
            .breakpoint(receiveOutput: {
                $0 == 7
            }) { $0 == .finished
        }
        .sink { _ in }
        .store(in: &cancellableSet)
    }
}

struct ContentView: View {
    var reactiveObject = ReactiveObject()
    
    var body: some View {
        VStack(spacing: 24) {
            Button {
                reactiveObject.handleEvents()
            } label: {
                Text("HandleEvents")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
            }
            Button {
                reactiveObject.printDebug()
            } label: {
                Text("Print")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
            }
            
            Button {
                reactiveObject.breakPoint()
            } label: {
                Text("Breakpoint")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
