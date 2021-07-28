//
//  MusicPlayer.swift
//  MusicPlayer
//
//  Created by Giordano Scalzo on 25/07/2021.
//

import SwiftUI

class MusicPlayer: ObservableObject {
    @Published
    var currentSong: Song?
    
    func pressButton(song: Song) {
        if currentSong == song {
            currentSong = nil
        } else {
            currentSong = song
        }
    }
}
