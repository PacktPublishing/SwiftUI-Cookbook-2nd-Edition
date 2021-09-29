//
//  ContentView.swift
//  SpamWords
//
//  Created by Giordano Scalzo on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    let service = SpamWordsLanguagesService()
    @State var languages: [Language] = []
    
    var body: some View {
        NavigationView {
            List(languages) { language in
                NavigationLink(destination: SpamWordsView(language: language)) {
                    Text(language.label)
                }
            }
            .navigationTitle("Languages")
        }
        .listStyle(.plain)
        .task {
            languages = await service.fetchLanguages()
        }
    }
}

struct SpamWordsView: View {
    let service = SpamWordsLanguagesService()
    
    let language: Language
    @State var words: [String] = []
    
    var body: some View {
        List(words, id: \.self) { word in
            Text(word)
        }
        .navigationTitle(language.label)
        .task {
            words = await service.fetchWords(language: language)
        }
    }
}

struct Language: Decodable, Identifiable {
    var id: String { code }
    let code: String
    let label: String
}

struct LanguageList: Decodable {
    let codeLanguages: [Language]
}

struct SpamWords: Decodable {
    let words: [String]
}

struct SpamWordsLanguagesService {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private func fetch<T: Decodable>(type: T.Type, from urlString: String) async -> T? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            
            return try decoder.decode(type, from: data)
        } catch {
            return nil
        }
    }
    
    func fetchLanguages() async -> [Language] {
        await fetch(type: LanguageList.self,
                           from: "https://www.spam-words.com/api/languages")?
            .codeLanguages ?? []
    }
    
    func fetchWords(language: Language) async -> [String] {
        await fetch(type: SpamWords.self,
                           from: "https://www.spam-words.com/api/words/" + language.code)?
            .words ?? []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
