//
//  ContentView.swift
//  PresentingSheets
//
//  Created by Edgar Nzokwe on 9/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @State private var sheetWithNav = false;
    var body: some View {
        VStack {
            Button("Display Sheet"){
                self.showSheet = true
            }.sheet(isPresented: $showSheet){
                SheetView()
            }
            
            Button("SheetWithNavigationBar"){
                self.sheetWithNav = true
            }.sheet(isPresented: $sheetWithNav){
                SheetWithNavView(sheetWithNav: self.$sheetWithNav)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
