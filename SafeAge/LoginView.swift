//
//  LoginView.swift
//  SafeAge
//
//  Created by user1 on 16/01/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    // @State private var wrongUsername = 0
    // @State private var wrongPassword = 0
    @State private var showingNextScreen = false
    @State private var showingSignUpScreen = false
    @State private var isPasswordVisible = false
    @State private var userLoggedIn = false
    
    
    var body: some View {
        if userLoggedIn {
            TabBar()
        }
        else{
            content
        }
    }
    
    var content: some View {
        ZStack{
            //right upper circle
            Circle()
                .fill(Color.black)
                .offset(x:160, y: -430)
            
            //left upper circle
            Circle()
                .fill(Color.black)
                .offset(x:-160,y: -430)
            //middle upper circle
            Circle()
                .fill(Color.frontrect)
                .offset(x:20 , y: -450)
            //below right circle
            Circle()
                .fill(Color.blue)
                .offset(x:180, y:450)
            // below left circle
            Circle()
                .fill(Color.black)
                .offset(x:-180, y:450)
            
            VStack{
                Text("SafeAge")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom,10)
                
                Text("Welcome")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                // .border(.red, width: CGFloat(wrongUsername))
                    .autocapitalization(.none)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                //.border(.red, width: CGFloat(wrongPassword))
                    .autocapitalization(.none)
                
                Button(action: {
                    // Action for sign up
                    login()
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)
                                            NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                                                EmptyView()
                                            }
                }
                //                Button("Login") {
                //                    login()
                //                   // showingNextScreen.toggle()
                //                }
                //                .foregroundColor(.white)
                //                .frame(width: 300, height: 50)
                //                .background(Color.blue)
                //                .cornerRadius(10)
                //                //.padding(.top, 20)
                //                NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                //                    EmptyView()
                //                }
                
                Button(action: {
                    // Action for sign up
                    register()
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 15)
                                            NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                                                EmptyView()
                                            }
                }
                
                //                Button("Signup") {
                //                    register()
                //                   // showingNextScreen.toggle()
                //
                //                }
                //                .foregroundColor(.white)
                //                .frame(width: 300, height: 50)
                //                .background(Color.blue)
                //                .cornerRadius(10)
                //                .padding(.top, 15)
                //                NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                //                    EmptyView()
                //                }
                
                .onAppear(){
                    Auth.auth().addStateDidChangeListener {auth, user in
                        if user != nil {
                            userLoggedIn.toggle()
                        }
                    }
                }
                
//                HStack {
//                    Spacer()
//                    Button("New User ?") {
//                        showingSignUpScreen.toggle()
//                    }
//                    .foregroundColor(.blue)
//                    .padding(.horizontal, 40)
//                    .font(.callout)
//                    .frame(alignment: .trailing)
//                    .padding(.trailing, 8)
//                    
//                    NavigationLink(destination: signup_page(), isActive: $showingSignUpScreen) {
//                        EmptyView()
//                    }
//                    
//                }
//                .padding(.top, 20)
            }
            .navigationBarHidden(true)
        }
        .padding()
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
