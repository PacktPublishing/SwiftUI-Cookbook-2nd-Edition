//
//  ContentView.swift
//  StrongBeerList
//
//  Created by Giordano Scalzo on 30/09/2021.
//

import SwiftUI

struct Beer: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let abv: Float
    let tagline: String
    let imageUrl: String?
}

struct Service {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchBeers(page: Int) async -> [Beer] {
        guard let url = URL(string:
              "https://api.punkapi.com/v2/beers?abv_gt=10&page=\(page)&per_page=20")
        else {
            return []
        }
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            return try decoder.decode([Beer].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

struct LogoView: View {
    let beer: Beer
    let placeHolder = "https://via.placeholder.com/050/FFFF00"
    var body: some View {
        AsyncImage(
            url: URL(string: beer.imageUrl ?? placeHolder ),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

struct BeerView: View {
    let beer: Beer
    var abv: String {
        String(format: "%.2f %", beer.abv)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(beer.name) - \(abv)")
                .font(.headline)
            Text("\(beer.tagline)")
                .font(.subheadline)
        }
    }
}

struct ContentView: View {
    let service = Service()
    @State var beers: [Beer] = []
    @State var page = 1
    
    var body: some View {
        List(beers) { beer in
            HStack {
                LogoView(beer: beer)
                BeerView(beer: beer)
            }
            .task {
                if beer == beers.last {
                    page += 1
                    beers += await service.fetchBeers(page: page)
                }
            }
        }
        .task {
            beers = await service.fetchBeers(page: page)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
