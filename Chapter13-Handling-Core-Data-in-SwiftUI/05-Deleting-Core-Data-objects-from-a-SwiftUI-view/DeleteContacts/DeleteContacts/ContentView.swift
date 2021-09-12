//
//  ContentView.swift
//  DeleteContacts
//
//  Created by Giordano Scalzo on 03/09/2021.
//

import SwiftUI

struct ContactView: View {
    let contact: Contact
    var body: some View {
        HStack {
            Text(contact.firstName ?? "-")
            Text(contact.lastName ?? "-")
            Spacer()
            Text(contact.phoneNumber ?? "-")
        }
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var managedObjectContext
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Contact.lastName, ascending: true),
            NSSortDescriptor(keyPath: \Contact.firstName, ascending: true),
        ]
    )
    var contacts: FetchedResults<Contact>
    
    var body: some View {
        List {
            ForEach(contacts, id: \.self) {
                ContactView(contact: $0)
            }
            .onDelete(perform: deleteContact)
        }
        .listStyle(.plain)
    }
    
    private func deleteContact(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }

        managedObjectContext.delete(contacts[index])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
