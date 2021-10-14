//
//  ContentView.swift
//  CoolGifList
//
//  Created by Giordano Scalzo on 12/10/2021.
//

import SwiftUI
import NukeUI

struct Gif: Identifiable, Codable, Equatable {
    static func == (lhs: Gif, rhs: Gif) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String
    let title: String
    var url: String {
        images.downsized.url
    }
    let images: Images
}

struct Images: Codable {
    let downsized: Image
}

struct Image: Codable {
    let url: String
}

struct Response: Codable {
    let data: [Gif]
}


struct Service {
    private let apiKey = <INSERT YOUR KEY>
    private let pageSize = 10
    private let query = "cat"

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchGifs(page: Int) async -> [Gif] {
        let offset = page * pageSize
        guard let url = URL(string:
                                "https://api.giphy.com/v1/gifs/search?api_key=\(apiKey)&q=\(query)&limit=\(pageSize)&offset=\(offset)")
        else {
            return []
        }
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            let response = try decoder.decode(Response.self, from: data)
            return response.data
        } catch {
            print(error)
            return []
        }
    }
}

struct ContentView: View {
    let service = Service()
    @State var gifs: [Gif] = []
    @State var page = 0
    
    var body: some View {
        List(gifs) { gif in
            VStack {
                LazyImage(source: gif.url)
                    .aspectRatio(contentMode: .fit)
                Text(gif.title)
            }
            .task {
                if gif == gifs.last {
                    page += 1
                    gifs += await service.fetchGifs(page: page)
                }
            }
        }
        .listStyle(.plain)
        .task {
            gifs = await service.fetchGifs(page: page)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
