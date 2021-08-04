//
//  ContentView.swift
//  FormValidation
//
//  Created by Giordano Scalzo on 04/08/2021.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject {
    // Input
    @Published
    var username = ""
    @Published
    var password = ""
    @Published
    var confirmPassword = ""
    
    // Input
    @Published
    var isValid = false
    @Published
    var usernameMessage = " "
    @Published
    var passwordMessage = " "
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        usernameValidPublisher
            .receive(on: RunLoop.main)
            .map { $0 ? " "
                : "Username must be at least 6 characters long" }
            .assign(to: \.usernameMessage, on: self)
            .store(in: &cancellableSet)
        
        passwordValidPublisher
            .receive(on: RunLoop.main)
            .map { passwordCheck in
                switch passwordCheck {
                case .invalidLength:
                    return "Password must be at least 8 characters long"
                case .noMatch:
                    return "Passwords don't match"
                case .weakPassword:
                    return "Password is too weak"
                default:
                    return " "
                }
            }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellableSet)
        
        formValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
        
    }
}

private extension SignupViewModel {
    var usernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.count >= 5 }
            .eraseToAnyPublisher()
    }
    
    var validPasswordLengthPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.count >= 8 }
            .eraseToAnyPublisher()
    }
    
    var strongPasswordPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map(\.isStrong)
            .eraseToAnyPublisher()
    }
    
    var matchingPasswordsPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest($password, $confirmPassword)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { password, confirmedPassword in
                password == confirmedPassword
            }
            .eraseToAnyPublisher()
    }
    
    var passwordValidPublisher: AnyPublisher<PasswordCheck, Never> {
        Publishers
            .CombineLatest3(validPasswordLengthPublisher,
                            strongPasswordPublisher,
                            matchingPasswordsPublisher)
            .map { validLength, strong, matching in
                if (!validLength) {
                    return .invalidLength
                }
                if (!strong) {
                    return .weakPassword
                }
                if (!matching) {
                    return .noMatch
                }
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    var formValidPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest(usernameValidPublisher, passwordValidPublisher)
            .map { usernameIsValid, passwordIsValid in
                usernameIsValid && (passwordIsValid == .valid)
            }
            .eraseToAnyPublisher()
    }
}

enum PasswordCheck {
    case valid
    case invalidLength
    case noMatch
    case weakPassword
}

extension String {
    var isStrong: Bool {
        containsACharacter(from: .lowercaseLetters) &&
        containsACharacter(from: .uppercaseLetters) &&
        containsACharacter(from: .decimalDigits) &&
        containsACharacter(from: .alphanumerics.inverted)
    }
    
    private func containsACharacter(from set: CharacterSet) -> Bool {
        rangeOfCharacter(from: set) != nil
    }
}

struct CustomStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(5)
    }
}

extension TextField {
    func custom() -> some View {
        modifier(CustomStyle())
            .autocapitalization(.none)
    }
}

extension SecureField {
    func custom() -> some View {
        modifier(CustomStyle())
    }
}

struct ContentView: View {
    @ObservedObject
    private var signupViewModel = SignupViewModel()
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
            VStack(spacing: 24) {
                VStack(alignment: .leading) {
                    Text(signupViewModel.usernameMessage).foregroundColor(.red)
                    TextField("Username", text: $signupViewModel.username)
                        .custom()
                }
                VStack(alignment: .leading) {
                    Text(signupViewModel.passwordMessage).foregroundColor(.red)
                    SecureField("Password", text: $signupViewModel.password)
                        .custom()
                    SecureField("Repeat Password", text: $signupViewModel.confirmPassword)
                        .custom()
                }
                Button {
                    print("Succesfully registered!")
                } label: {
                    Text("Register")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 44)
                        .background(signupViewModel.isValid ? Color.green : Color.red)
                        .cornerRadius(10)
                }.disabled(!signupViewModel.isValid)
            }
            .padding(.horizontal, 24)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
