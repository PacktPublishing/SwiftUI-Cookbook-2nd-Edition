//
//  ContentView.swift
//  GithubUsers
//
//  Created by Giordano Scalzo on 06/08/2021.
//

import SwiftUI
import Combine

struct GithubUser: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
}

class Github: ObservableObject {
    @Published
    var users: [GithubUser] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func load() {
        let url = URL(string: "https://api.github.com/users")!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared
            .dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .decode(type: [GithubUser].self, decoder: decoder)
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &cancellableSet)
    }
}

struct ContentView: View {
    @StateObject var github = Github()
    
    var body: some View {
        List(github.users) {
            GithubUserView(user: $0)
        }
        .task { github.load() }
    }
}

struct GithubUserView: View {
    let user: GithubUser
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.purple.opacity(0.1)
            }
            .frame(width: 40, height: 40)
            .cornerRadius(20)
            Spacer()
            Text(user.login)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
