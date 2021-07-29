//
//  ContentView.swift
//  CustomRows
//
//  Created by Edgar Nzokwe on 7/27/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            ForEach(weatherData){weather in
                WeatherRow(weather: weather)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
