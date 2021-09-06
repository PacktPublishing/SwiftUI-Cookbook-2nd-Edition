//
//  CurrenciesView.swift
//  UsingTabViews
//
//  Created by Edgar Nzokwe on 9/5/21.
//

import SwiftUI

struct CurrenciesView: View {
    var body: some View {
        NavigationView {
            VStack{
                ForEach(currencies){ currency in
                    HStack{
                        Group{
                            Text(currency.name)
                            Spacer()
                            Image(systemName: currency.image)
                        }.font(Font.system(size: 40, design: .default))
                        .padding()
                    }
                }
            }.navigationBarTitle("Currencies")
        }
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView()
    }
}
