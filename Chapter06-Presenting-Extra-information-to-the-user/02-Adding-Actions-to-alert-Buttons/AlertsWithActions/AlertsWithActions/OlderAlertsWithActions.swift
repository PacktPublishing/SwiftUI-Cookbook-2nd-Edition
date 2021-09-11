//
//  OlderAlertsWithActions.swift
//  OlderAlertsWithActions
//
//  Created by Edgar Nzokwe on 9/11/21.
//

import SwiftUI

struct OlderAlertsWithActions: View {
    @State private var changeText = false
    @State private var displayText = "Tap to Change Text"
    var body: some View {
        Text(displayText)
            .onTapGesture {
                self.changeText = true
        }
        .alert(isPresented: $changeText){
                Alert(title: Text("Changing Text"),
                      message: Text("Do you want to change the displayed text"),
                      primaryButton: .cancel(),
                      secondaryButton:  .default(Text("OK")){
                self.displayText = (self.displayText == "Stay Foolish") ? "Stay Hungry" : "Stay Foolish"
            }
            )
        }
    }
}

struct OlderAlertsWithActions_Previews: PreviewProvider {
    static var previews: some View {
        OlderAlertsWithActions()
    }
}

