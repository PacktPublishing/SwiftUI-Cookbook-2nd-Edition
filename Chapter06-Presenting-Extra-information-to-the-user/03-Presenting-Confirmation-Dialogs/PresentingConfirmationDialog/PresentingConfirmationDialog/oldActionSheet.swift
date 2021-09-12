//
//  oldActionSheet.swift
//  oldActionSheet
//
//  Created by Edgar Nzokwe on 9/11/21.
//

import SwiftUI

struct oldActionSheet: View {
    @State private var showSheet = false
    var body: some View {
        Text("Present Sheet")
            .onTapGesture {
                self.showSheet = true
        }
        .actionSheet(isPresented: $showSheet){
            ActionSheet(
                title: Text("ActionSheet"),
                message: Text("Use Action sheet to give users alteratives to completing a task").font(.largeTitle),
                buttons: [
                    .default(Text("Dismiss Sheet")),
                    .default(Text("Save")),
                    .destructive(Text("Cancel")),
                    .default(Text("Print to console")){
                        print("Print button clicked")
                    }
            ])
        }
    }
}

struct oldActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        oldActionSheet()
    }
}
