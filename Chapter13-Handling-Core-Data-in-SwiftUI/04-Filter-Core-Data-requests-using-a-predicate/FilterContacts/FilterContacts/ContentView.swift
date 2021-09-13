//
//  ContentView.swift
//  FilterContacts
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

struct FilteredContacts: View {
    let fetchRequest: FetchRequest<Contact>
    
    init(filter: String) {
        let predicate: NSPredicate? = filter.isEmpty ?
        nil :
        NSPredicate(format: "lastName BEGINSWITH %@", filter)
        fetchRequest = FetchRequest<Contact>(
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Contact.lastName,
                                 ascending: true),
                NSSortDescriptor(keyPath: \Contact.firstName,
                                 ascending: true)],
            predicate: predicate)
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) {
            ContactView(contact: $0)
        }
        .listStyle(.plain)
    }
}

struct ContentView: View {
    @State
    private var searchText : String = ""
    
    var body: some View {
        NavigationView {
            FilteredContacts(filter: searchText)
                .navigationBarTitle("Contacts", displayMode: .inline)
        }
        .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
