//
//  PasteButtonView.swift
//  ButtonsApp
//
//  Created by Edgar Nzokwe on 9/14/21.
//

import SwiftUI

struct PasteButtonView: View {
    @State var text  = String()
    var body: some View {
        VStack{
            Text("PasteButton controls how you paste in macOS but is not available in iOS. For more information, check the \"See also\" section of this recipe")
                .padding()
        }.navigationBarTitle("PasteButton", displayMode: .inline)
    }
}

struct PasteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PasteButtonView()
    }
}
