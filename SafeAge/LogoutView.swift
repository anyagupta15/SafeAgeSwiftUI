//
//  LogoutView.swift
//  SafeAge
//
//  Created by user1 on 16/03/24.
//
import SwiftUI
import Firebase
struct LogoutView: View {
    @State private var isLoggedOut = false

    var body: some View {
       // NavigationView {
            if isLoggedOut {
                LoginView()
            } else {
                VStack {
                    Text("Logged Out Successfully")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        signOut()
                    }) {
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .navigationBarHidden(true)
            }
       // }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
            isLoggedOut = true
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView()
    }
}

