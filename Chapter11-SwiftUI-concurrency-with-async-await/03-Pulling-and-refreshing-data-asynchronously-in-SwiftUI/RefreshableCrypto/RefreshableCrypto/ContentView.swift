//
//  ContentView.swift
//  RefreshableCrypto
//
//  Created by Giordano Scalzo on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    let service = Service()
    @State var coins: [Coin] = []
    
    var body: some View {
        List(coins) {
            CoinView(coin: $0)
        }
        .listStyle(.plain)
        .refreshable {
            coins = await service.fetchCoins()
        }
        .task {
            coins = await service.fetchCoins()
        }
        
    }
}

struct CoinView: View {
    let coin: Coin
    var body: some View {
        HStack {
            Text("\(coin.acronym): \(coin.coinName)")
            Spacer()
            LogoView(coin: coin)
        }
    }
}

struct LogoView: View {
    let coin: Coin
    var body: some View {
        AsyncImage(
            url: URL(string: coin.logo),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}


struct Service {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchCoins() async -> [Coin] {
        guard let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10") else {
            return []
        }
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            
            let list = try decoder.decode([Coin].self, from: data)
            return list.sorted {
                $0.acronym < $1.acronym
            }
        } catch {
            return []
        }
    }
}

struct Coin: Decodable, Identifiable {
    let id: Int
    let coinName: String
    let acronym: String
    let logo: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
