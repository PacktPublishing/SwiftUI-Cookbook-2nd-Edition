//
//  ContentView.swift
//  FetchContacts
//
//  Created by Giordano Scalzo on 01/09/2021.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Contact.lastName, ascending: true),
            NSSortDescriptor(keyPath: \Contact.firstName, ascending: true),
        ]
    )
    var contacts: FetchedResults<Contact>
    
    var body: some View {
        List(contacts, id: \.self) { contact in
            HStack {
                Text(contact.firstName ?? "-")
                Text(contact.lastName ?? "-")
                Spacer()
                Text(contact.phoneNumber ?? "-")
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
