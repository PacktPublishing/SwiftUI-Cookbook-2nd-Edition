//
//  LoginView.swift
//  FormFieldDisable
//
//  Created by Edgar Nzokwe on 9/4/21.
//

import SwiftUI


struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack{
            Text("Dungeons and Wagons")
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .font(.largeTitle)
                .padding(.bottom, 30)
            
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundColor(.gray)
                .padding(.bottom,40)
            
            Group{
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )

            Button(action: {
                print("Login clicked")
            }){
                Text("Login")
                }.padding()
                .background((username.isEmpty || password.isEmpty) ? .gray : Color.blue)
                .foregroundColor(Color.white)
                .clipShape(Capsule())
            .disabled(username.isEmpty || password.isEmpty)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
