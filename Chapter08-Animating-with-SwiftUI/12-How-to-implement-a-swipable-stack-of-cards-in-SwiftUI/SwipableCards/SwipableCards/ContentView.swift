//
//  ContentView.swift
//  SwipableCards
//
//  Created by Giordano Scalzo on 06/07/2021.
//

import SwiftUI

struct User: Identifiable, Equatable {
    var id: Int
    let firstName: String
    let lastName: String
    let start: Color
    let end: Color
}

extension Array where Element == User {
    var maxId: Int { map { $0.id }.max() ?? 0 }
    
    func cardOffset(userId: Int) -> Double {
        Double(count - 1 - userId) * 8.0
    }
    
    func cardWidth(in geometry: GeometryProxy, userId: Int) -> Double {
        geometry.size.width - cardOffset(userId: userId)
    }
}

extension DragGesture.Value {
    func percentage(in geometry: GeometryProxy) -> Double {
        abs(translation.width / geometry.size.width)
    }
}

struct CardView: View {
    @State
    private var translation: CGSize = .zero
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
    private var threshold: CGFloat = 0.5
    
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 20) {
                Rectangle()
                    .fill(LinearGradient(gradient:
                                            Gradient(colors: [user.start, user.end]),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .cornerRadius(10)
                    .frame(width: geometry.size.width - 40,
                           height: geometry.size.height * 0.65)
                
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title)
                    .bold()
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 5)
            .animation(.spring(), value: translation)
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 20),
                            anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged {
                        translation = $0.translation
                    }.onEnded {
                        if $0.percentage(in: geometry) > self.threshold {
                            onRemove(user)
                        } else {
                            translation = .zero
                        }
                    }
            )
        }
        
    }
}

struct ContentView: View {
    @State
    private var users: [User] = [
        User(id: 0, firstName: "Mark",
             lastName: "Bennett",
             start: .red, end: .green),
        User(id: 1, firstName: "John",
             lastName: "Lewis",
             start: .green, end: .orange),
        User(id: 2, firstName: "Joan",
             lastName: "Mince",
             start: .blue, end: .green),
        User(id: 3, firstName: "Liz",
             lastName: "Garret",
             start: .orange, end: .purple),
        User(id: 4, firstName: "Lola",
             lastName: "Pince",
             start: .yellow, end: .gray),
        User(id: 5, firstName: "Jim",
             lastName: "Beam",
             start: .pink, end: .yellow),
        User(id: 6, firstName: "Tom",
             lastName: "Waits",
             start: .purple, end: .blue),
        User(id: 7, firstName: "Mike",
             lastName: "Rooney",
             start: .black, end: .gray),
        User(id: 8, firstName: "Jane",
             lastName: "Doe",
             start: .red, end: .green),
    ]
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(users) { user in
                    if user.id > users.maxId - 4 {
                        CardView(user: user, onRemove: { removedUser in
                            users.removeAll { $0.id == removedUser.id }
                        })
                            .animation(.spring(), value: users)
                            .frame(width: users.cardWidth(in: geometry,
                                                          userId: user.id),
                                   height: 400)
                            .offset(x: 0, y: users.cardOffset(userId: user.id))
                    }
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
