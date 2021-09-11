//
//  oldAlerts.swift
//  oldAlerts
//
//  Created by Edgar Nzokwe on 9/11/21.
//

import SwiftUI

struct oldAlerts: View {
    @State private var showSubmitAlert = false;
    var body: some View {
        Button(action: {
            self.showSubmitAlert=true
        }){
            Text("Submit")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        .alert(isPresented: $showSubmitAlert ){
            Alert(title: Text("Confirm Action"),
                  message: Text("Are you sure you want to submit the form"),
                  dismissButton: .default(Text("OK"))
            )

        }
    }
}

struct oldAlerts_Previews: PreviewProvider {
    static var previews: some View {
        oldAlerts()
    }
}
