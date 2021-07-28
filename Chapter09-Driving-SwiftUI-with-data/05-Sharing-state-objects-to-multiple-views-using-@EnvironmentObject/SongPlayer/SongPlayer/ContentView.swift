//
//  ContentView.swift
//  SongPlayer
//
//  Created by Giordano Scalzo on 25/07/2021.
//

import SwiftUI

struct Song: Identifiable, Equatable {
    var id = UUID()
    let artist: String
    let name: String
    let cover: String
}

struct ContentView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    
    private let songs = [
        Song(artist: "Luke", name: "99", cover: "cover0"),
        Song(artist: "Foxing", name: "No Trespassing", cover: "cover1"),
        Song(artist: "Breaking Benjamin", name: "Phobia", cover: "cover2"),
        Song(artist: "J2", name: "Solenoid", cover: "cover3"),
        Song(artist: "Wildflower Clothing", name: "Lightning Bottles", cover: "cover4"),
        Song(artist: "The Broken Spirits", name: "Rubble", cover: "cover5"),
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                List(self.songs) { song in
                    SongView(song: song)
                }
                .listStyle(.plain)
                .navigationTitle("Music Player")
            }
            MiniPlayerView()
                .background(.gray)
                .offset(y: 44)
        }
        
    }
}


struct MiniPlayerView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    
    var body: some View {
        if let currentSong = musicPlayer.currentSong {
            SongView(song: currentSong)
                .padding(.all, 24)
        } else {
            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
        }
    }
}
struct SongView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    let song: Song
    
    var body: some View {
        HStack {
            NavigationLink(destination: PlayerView(song: song)) {
                Image(song.cover)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text(song.name)
                    Text(song.artist).italic()
                }
            }
            
            Spacer()
            PlayButton(song: song)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct PlayerView: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    let song: Song
    
    var body: some View {
        VStack {
            Image(song.cover)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
            HStack {
                Text(song.name)
                Text(song.artist).italic()
            }
            PlayButton(song: song)
        }
    }
}

struct PlayButton: View {
    @EnvironmentObject
    private var musicPlayer: MusicPlayer
    let song: Song
    
    private var buttonText: String {
        if song == musicPlayer.currentSong {
            return "stop"
        } else {
            return "play"
        }
        
    }
    
    var body: some View {
        Button {
            musicPlayer.pressButton(song: song)
        } label: {
            Image(systemName: buttonText)
                .font(.system(.largeTitle))
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MusicPlayer())
    }
}
