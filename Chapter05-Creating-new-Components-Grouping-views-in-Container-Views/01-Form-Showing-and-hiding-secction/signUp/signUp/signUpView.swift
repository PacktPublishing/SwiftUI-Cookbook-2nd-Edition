//
//  signUpView.swift
//  signUp
//
//  Created by Edgar Nzokwe on 8/28/21.
//

import SwiftUI


import SwiftUI

struct signUpView: View {
    @State private var fname = ""
    @State private var lname = ""
    @State private var street = ""
    @State private var city = ""
    @State private var zip = ""
    @State private var lessThanTwo = false
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationView{
            Form{
                Section("Names"){
                    TextField("First Name", text: $fname)
                    TextField("Last Name" , text: $lname)
                }
                Section("Current Address"){
                    TextField("Street Address" , text: $street)
                    TextField("City" , text: $city)
                    TextField("Zip" , text: $zip)
                    Toggle(isOn: $lessThanTwo){
                        Text("Have you lived here for 2+ years")
                    }
                }
                if !lessThanTwo{
                    Section("Previous Address"){
                        TextField("Street Address" , text: $street)
                        TextField("City" , text: $city)
                        TextField("Zip" , text: $zip)
                    }
                }
                Section() {
                    TextField("Create Username" , text: $username)
                    SecureField("Password", text: $password)
                }
                
                Button("Submit") {
                    print("Form submit action here")
                }
              
            }.navigationBarTitle("Sign Up")
        }
    }
}

struct signUpView_Previews: PreviewProvider {
    static var previews: some View {
        signUpView()
    }
}
