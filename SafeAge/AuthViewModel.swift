//import SwiftUI
//import Firebase
//
//class AuthViewModel: ObservableObject {
//    @Published var isLoggedIn = false
//    
//    init() {
//        // Initialize Firebase App
//       // FirebaseApp.configure()
//        
//        // Check authentication state
//        Auth.auth().addStateDidChangeListener { _, user in
//            self.isLoggedIn = user != nil
//        }
//    }
//}
//
//struct AuthView: View {
//    @StateObject var authViewModel = AuthViewModel()
//    
//    var body: some View {
//        // You can access authViewModel.isLoggedIn to check the login state
//        if authViewModel.isLoggedIn {
//            Text("User is logged in")
//        } else {
//            Text("User is logged out")
//        }
//    }
//}
