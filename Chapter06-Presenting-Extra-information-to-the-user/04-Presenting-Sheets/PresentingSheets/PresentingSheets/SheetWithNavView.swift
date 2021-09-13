//
//  SheetWithNavView.swift
//  SheetWithNavView
//
//  Created by Edgar Nzokwe on 9/12/21.
//

import SwiftUI

struct SheetWithNavView: View {
    @Binding var sheetWithNav: Bool
    var body: some View {
        NavigationView{
            Text("Sheet with navigation")
                .navigationBarTitle(Text("Sheet title"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action:{
                    self.sheetWithNav = false;
                }){
                    Text("Done")
                })
        }
        
    }
}

struct SheetWithNavView_Previews: PreviewProvider {
    static var previews: some View {
        SheetWithNavView(sheetWithNav: .constant(true))
    }
}
