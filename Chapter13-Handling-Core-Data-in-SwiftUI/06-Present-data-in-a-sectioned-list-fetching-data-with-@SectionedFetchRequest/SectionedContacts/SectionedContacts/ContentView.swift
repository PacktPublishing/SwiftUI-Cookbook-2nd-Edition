//
//  ContentView.swift
//  SectionedContacts
//
//  Created by Giordano Scalzo on 04/09/2021.
//

import SwiftUI

extension Contact {
    @objc var lastNameInitial: String {
        get {
            if let initial = lastName?.prefix(1) {
                return String(initial)
            } else {
                return ""
            }
        }
    }
}

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
    @SectionedFetchRequest<String, Contact>(
        sectionIdentifier: \.lastNameInitial,
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Contact.lastName, ascending: true),
            NSSortDescriptor(keyPath: \Contact.firstName, ascending: true),
        ],
        animation: .default
    )
    var sectionedContacts
    
    var body: some View {
        NavigationView {
            VStack {
                List(sectionedContacts) { section in
                    Section(header: Text("Section for '\(section.id)'")) {
                        ForEach(section) {
                            ContactView(contact: $0)
                        }
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}
