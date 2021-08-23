//
//  SecondView.swift
//  PreviewingInNavigationView
//
//  Created by Edgar Nzokwe on 8/22/21.
//

import SwiftUI

struct SecondView: View {
    var someText:String
    var body: some View {
        Text(someText)
            .navigationBarTitle("Second View ", displayMode: .inline)
    }
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SecondView(someText: "Testing")
        }
    }
}

