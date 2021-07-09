//
//  ContentView.swift
//  BarChart
//
//  Created by Giordano Scalzo on 02/07/2021.
//

import SwiftUI

enum Month: String, CaseIterable {
    case jan, feb, mar, apr, may, jun,
         jul, aug, sep, oct, nov, dec
}

struct MonthDataPoint: Identifiable {
    var id: String { month.rawValue }
    let month: Month
    let value: Double
    var name: String {
        month.rawValue.capitalized
    }
}

extension Array where Element == Double {
    func monthDataPoints() -> [MonthDataPoint] {
        zip(Month.allCases, self)
            .map(MonthDataPoint.init)
    }
}

// data from: https://www.climatestotravel.com/
struct DataSet {
    static let dublin = [
        0.65, 0.50, 0.55, 0.55, 0.60, 0.65,
        0.55, 0.75, 0.60, 0.80, 0.75, 0.75
    ].monthDataPoints()
    
    static let milan = [
        0.65, 0.65, 0.80, 0.80, 0.95, 0.65,
        0.70, 0.95, 0.70, 1.00, 1.00, 0.60
    ].monthDataPoints()
    
    static let london = [
        0.55, 0.40, 0.40, 0.45, 0.50, 0.45,
        0.45, 0.50, 0.50, 0.70, 0.60, 0.55,
    ].monthDataPoints()
}

struct BarView: View {
    var dataPoint: MonthDataPoint
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 18,
                           height: 180)
                Rectangle()
                    .fill(.white)
                    .frame(width: 18,
                           height: dataPoint.value * 180.0)
            }
            Text(dataPoint.name)
                .font(.system(size: 11))
                .rotationEffect(.degrees(-45))
        }
    }
}

struct BarChartView: View {
    var dataPoints: [MonthDataPoint]
    
    var body: some View {
        HStack (spacing: 12) {
            ForEach(dataPoints) {
                BarView(dataPoint: $0)
            }
        }
    }
}

struct ContentView: View {
    let dataSet = [
        DataSet.dublin,
        DataSet.milan,
        DataSet.london
    ]
    
    @State
    var selectedCity = 0
    
    var body: some View {
        VStack (spacing: 24) {
            Spacer()
            Text("Average Precipitation")
                .font(.system(size: 32))
            
            Picker(selection: self.$selectedCity, label: Text("Average Precipitation")) {
                Text("Dublin").tag(0)
                Text("Milan").tag(1)
                Text("London").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            BarChartView(dataPoints: dataSet[selectedCity])
            Spacer()
        }
        .padding(.horizontal, 10)
        .background(
            .mint,
            ignoresSafeAreaEdges: .vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
