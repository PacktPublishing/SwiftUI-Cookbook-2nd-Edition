//
//  WeatherRow.swift
//  CustomRows
//
//  Created by Edgar Nzokwe on 7/28/21.
//

import SwiftUI

struct WeatherRow: View {
    var weather: WeatherInfo
    var body: some View {
        HStack {
            Image(systemName: weather.image)
                .frame(width: 50, alignment: .leading)
            Text("\(weather.temp)°F")
                .frame(width: 80, alignment: .leading)
            Text(weather.city)
        }
        .font(.system(size: 25))
        .padding()
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(weather: WeatherInfo(image: "snow", temp: 5, city:"New York"))
    }
}
