//
//  ContentView.swift
//  GoogleLogin
//
//  Created by Giordano Scalzo on 25/08/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn

extension GIDSignIn {
    func restorePreviousSignIn() async -> (GIDGoogleUser?, Error?) {
        // https://www.hackingwithswift.com/books/concurrency/how-to-use-continuations-to-convert-completion-handlers-into-async-functions
        await withCheckedContinuation { continuation in
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                continuation.resume(with: .success((user, error)))
            }
        }
    }
    
    func signIn(with configuration: GIDConfiguration,
                presenting viewController: UIViewController) async -> (GIDGoogleUser?, Error?) {
        await withCheckedContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: viewController) { user, error in
                continuation.resume(with: .success((user, error)))
            }
        }
    }
}

struct GoogleLogin: UIViewRepresentable {
    @Binding
    var signedIn: Bool
    @Binding
    var username: String
    @Binding
    var email: String
    
    func makeUIView(context: Context) -> UIView {
        Task {
            let (user, error) = await GIDSignIn.sharedInstance.restorePreviousSignIn()
            await context.coordinator.sign(user: user, withError: error)
        }
        
        let button = GIDSignInButton()
        
        button.addTarget(context.coordinator,
                         action: #selector(Coordinator.action(sender:)),
                         for: .touchUpInside)
        
        return button
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    @MainActor
    class Coordinator: NSObject {
        private let parent: GoogleLogin
        
        init(_ parent: GoogleLogin) {
            self.parent = parent
        }
        
        @objc
        func action(sender: UIControl) {
            guard let clientID = FirebaseApp.app()?.options.clientID,
                  let rootViewController = UIApplication.currentRootViewController else {
                      return
                  }
            let configuration = GIDConfiguration(clientID: clientID)
            
            Task {
                let (user, error) = await GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController)
                await self.sign(user: user, withError: error)
            }
        }
        
        func sign(user: GIDGoogleUser?, withError error: Error?) async {
            guard let authentication = user?.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken!,
                                                           accessToken: authentication.accessToken)
            
            guard let authResult = try? await Auth.auth().signIn(with: credential) else {
                return
            }
            parent.signedIn = true
            if let username = authResult.user.displayName {
                parent.username = username
            }
            if let email = authResult.user.email {
                parent.email = email
            }
        }
    }
}

extension UIApplication {
    static var currentRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow})
            .first?
            .rootViewController
    }
}

struct GoogleLogout: UIViewRepresentable {
    @Binding
    var signedIn: Bool
    
    func makeUIView(context: Context) -> UIView {
        let button = UIButton(frame: .zero)
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(context.coordinator, action: #selector(Coordinator.onLogout), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        private let parent: GoogleLogout
        
        init(_ parent: GoogleLogout) {
            self.parent = parent
        }
        
        @objc
        func onLogout(button: UIButton) {
            GIDSignIn.sharedInstance.signOut()
            GIDSignIn.sharedInstance.disconnect()
            try? Auth.auth().signOut()
            parent.signedIn = false
        }
    }
}


struct ContentView: View {
    @State
    private var signedIn = false
    @State
    private var username: String = ""
    @State
    private var email: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            if signedIn {
                VStack(spacing: 4) {
                    Text("Username: \(username)")
                        .foregroundColor(.black)
                    Text("Email: \(email)")
                        .foregroundColor(.black)
                    GoogleLogout(signedIn: $signedIn)
                        .frame(width: 200, height: 30, alignment: .center)
                    
                }
            } else {
                GoogleLogin(signedIn: $signedIn, username: $username, email: $email)
                    .frame(width: 200, height: 30, alignment: .center)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
