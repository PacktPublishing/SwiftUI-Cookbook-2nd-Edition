//
//  Greetings.swift
//  AddSwiftUIToUIKit
//
//  Created by Edgar Nzokwe on 7/19/21.
//

import SwiftUI

struct Greetings: View {
    var textFromUIKit = ""
    var body: some View {
        Text(textFromUIKit)
    }
}


struct Greetings_Previews: PreviewProvider {
    static var previews: some View {
        Greetings()
    }
}
