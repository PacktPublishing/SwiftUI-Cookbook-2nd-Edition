//
//  ContentView.swift
//  AddContacts
//
//  Created by Giordano Scalzo on 02/09/2021.
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
    @State
    private var isAddContactPresented = false
    @EnvironmentObject
    var coreDataStack: CoreDataStack


    var body: some View {
        NavigationView {
            List(contacts, id: \.self) { contact in
                HStack {
                Text(contact.firstName ?? "-")
                Text(contact.lastName ?? "-")
                Spacer()
                Text(contact.phoneNumber ?? "-")
                }
            }
            .listStyle(.plain)
            .navigationBarTitle("Contacts", displayMode: .inline)
            .navigationBarItems(trailing:
                Button {
                    isAddContactPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
            })
                .sheet(isPresented: $isAddContactPresented) {
                    AddNewContact(isAddContactPresented:                                    $isAddContactPresented)
                        .environmentObject(coreDataStack)
            }
        }
    }
}

struct AddNewContact: View {
    @EnvironmentObject
    var coreDataStack: CoreDataStack

    @Binding
    var isAddContactPresented: Bool
    @State
    var firstName = ""
    @State
    var lastName = ""
    @State
    var phoneNumber = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                Spacer()
            }
            .padding(16)
            .navigationBarTitle(Text("Add A New Contact"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: saveContact) {
                    Image(systemName: "checkmark")
                        .font(.headline)
                }
                .disabled(isDisabled))
        }
    }

    private var isDisabled: Bool {
        firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty
    }

    private func saveContact() {
        coreDataStack.insertContact(firstName: firstName,
                       lastName: lastName,
                       phoneNumber: phoneNumber)
        coreDataStack.save()
        isAddContactPresented.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
