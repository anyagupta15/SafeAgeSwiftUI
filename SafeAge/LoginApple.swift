
import SwiftUI
import AuthenticationServices
struct LoginApple: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userID") var userID: String = ""
    
    @State private var showingNextScreen = false
    
    var body: some View {
            ZStack {
                // Background Circles
                Circle()
                    .fill(Color.black)
                    .offset(x: UIScreen.main.bounds.width / 2, y: -430)
                
                // left upper circle
                Circle()
                    .fill(Color.black)
                    .offset(x: -UIScreen.main.bounds.width / 2, y: -430)
                
                // middle upper circle
                Circle()
                    .fill(Color.frontrect)
                    .offset(x: 20, y: -450)
                
                // below right circle
                Circle()
                    .fill(Color.blue)
                    .offset(x: UIScreen.main.bounds.width / 2, y: 450)
                
                // below left circle
                Circle()
                    .fill(Color.black)
                    .offset(x: -UIScreen.main.bounds.width / 2, y: 450)
                
                VStack {
                    // Apple Sign-In Button
                    SignInWithAppleButton(.continue) { request in
                        request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result in
                        switch result {
                        case .success(let auth):
                            switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                let userID = credential.user
                                let email = credential.email
                                let firstName = credential.fullName?.givenName
                                let lastName = credential.fullName?.familyName
                                
                                self.email = email ?? ""
                                self.firstName = firstName ?? ""
                                self.lastName = lastName ?? ""
                                
                                // Proceed to the next screen
                                showingNextScreen = true
                                
                            default:
                                break
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 60) // Set button frame
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                        EmptyView()
                    }
                }
                .padding()
                .navigationBarHidden(true)
            }
  //          .navigationTitle("Sign In")
        
    }
}

