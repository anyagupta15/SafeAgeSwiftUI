//
//  signup_page.swift
//  SafeAge
//
//  Created by user1 on 16/01/24.
//

import SwiftUI
import AuthenticationServices

struct signup_page: View {
    @StateObject var loginData = LoginViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var showingNextScreen = false
    var body: some View {
           ZStack {
            // right upper circle
            Circle()
                .fill(Color.black)
                .offset(x: 160, y: -430)
            
            // left upper circle
            Circle()
                .fill(Color.black)
                .offset(x: -160, y: -430)
            
            // middle upper circle
            Circle()
                .fill(Color.frontrect)
                .offset(x: 20, y: -450)
            
            // below right circle
            Circle()
                .fill(Color.blue)
                .offset(x: 180, y: 450)
            
            // below left circle
            Circle()
                .fill(Color.black)
                .offset(x: -180, y: 450)
            VStack{
                Button{
                    
                }label:{
                    HStack{
                        Image("apple").resizable().scaledToFit().ignoresSafeArea()
                    }
                }
                .foregroundColor(.black)
                .frame(width: 400 , height: 60)
                .background(Color.white)
                .cornerRadius(10)
                
                
               
                //.padding(.top, 20)
                
                NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                    EmptyView()
                }
                //login button
                SignInWithAppleButton{ (request) in
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email,.fullName]
                    request.nonce = sha256(loginData.nonce)
                } onCompletion:{(result) in
                    switch result{
                    case.success(let user):
                        print("success")
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                            print("error with firebase")
                            return
                        }
                        loginData.aunthenticate(credential: credential)
                    case.failure(let error):
                        print(error.localizedDescription)
                        
                    }
                    
                    
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height:55)
                .clipShape(Capsule())
                .padding(.horizontal,40)
                .offset(y: -55)
                
            }
            .navigationBarHidden(true)
               
        }
        }
    
//#if DEBUG
//    struct signup_page_Previews: PreviewProvider {
//        static var previews: some View {
//            signup_page()
//        }
//    }
//#endif
    
}

#Preview {
    signup_page()
}
