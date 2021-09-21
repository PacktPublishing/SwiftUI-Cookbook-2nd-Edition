//
//  HomeView.swift
//  UsingTabViews
//
//  Created by Edgar Nzokwe on 9/5/21.
//

import SwiftUI

let games = ["Doom", "Final F","Cyberpunk", "avengers", "animal trivia", "sudoku", "snakes and ladders", "Power rangers", "ultimate frisbee", "football", "soccer", "much more"]

struct HomeView: View {
    var body: some View {
        NavigationView{
            List {
                ForEach(games, id: \.self){ game in
                    Text(game).padding()
                }
            }.navigationBarTitle("Best Games for 2021", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
