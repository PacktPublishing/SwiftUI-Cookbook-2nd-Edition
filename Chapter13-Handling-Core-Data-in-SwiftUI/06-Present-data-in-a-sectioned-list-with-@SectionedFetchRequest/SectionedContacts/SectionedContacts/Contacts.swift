//
//  Contacts.swift
//  Contacts
//
//  Created by Giordano Scalzo on 01/09/2021.
//

import Foundation
import CoreData

func addContacts(to coreDataStack: CoreDataStack) {
    guard UserDefaults.standard.bool(forKey: "alreadyRun") == false else {
        return
    }
    UserDefaults.standard.set(true, forKey: "alreadyRun")

    [("Daenerys", lastName: "Targaryen", "02079460803"),
     ("Bran", lastName: "Stark", "02079460071"),
     ("Jon", lastName: "Snow", "02079460874"),
     ("Theon", lastName: "Greyjoy", "02890180771"),
     ("Ned", lastName: "Stark", "011774960111"),
     ("Tyrion", lastName: "Lannister", "02079460695"),
     ("Arya", lastName: "Stark", "02079460878"),
     ("Stannis", lastName: "Baratheon", "02079460367"),
     ("Samwell", lastName: "Tarly", "011774960104"),
     ("Jaime", lastName: "Lannister", "02890180239"),
     ("Jorah", lastName: "Mormont", "02079460025"),
     ("Jeor", lastName: "Mormont", "02079460127"),
     ("Robb", lastName: "Stark", "011774960384"),
     ("Joffrey", lastName: "Baratheon", "02079460963"),
     ("Tywin", lastName: "Lannister", "02890180899"),
     ("Margaery", lastName: "Tyrell", "011774960635"),
     ("Catelyn", lastName: "Stark", "02890180301"),
     ("Viserys", lastName: "Targaryen", "02079460220"),
     ("Cersei", lastName: "Lannister", "02890180492"),
     ("Davos", lastName: "Seaworth", "02079460848"),
     ("Sansa", lastName: "Stark", "02890180764")]
        .forEach { (firstName, lastName, phoneNumber) in
            coreDataStack.insertContact(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
    }
}
