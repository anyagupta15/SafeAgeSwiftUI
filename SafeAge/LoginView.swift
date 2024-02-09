//
//  LoginView.swift
//  SafeAge
//
//  Created by user1 on 16/01/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingNextScreen = false
    @State private var showingSignUpScreen = false
    @State private var isPasswordVisible = false
    
    var body: some View {
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
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                    .autocapitalization(.none)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                    .autocapitalization(.none)
                
                
                
                Button("Login") {
                    showingNextScreen.toggle()
                    aunthenticateUser(username: username, password: password)
                }
                .foregroundColor(.white)
                .frame(width: 201, height: 44)
                .background(Color.blue)
                .cornerRadius(10)
                //.padding(.top, 20)
                NavigationLink(destination: MainPage(), isActive: $showingNextScreen) {
                    EmptyView()
                }
                
                
                
                HStack {
                    Spacer()
                    Button("New User ?") {
                        showingSignUpScreen.toggle()
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal, 40)
                    .font(.callout)
                    .frame(alignment: .trailing)
                    .padding(.trailing, 8)
                    
                    NavigationLink(destination: signup_page(), isActive: $showingSignUpScreen) {
                        EmptyView()
                    }
                }
                .padding(.top, 20)
                            }
            .navigationBarHidden(true)
        }
        .padding()
    }

                    
                    func aunthenticateUser(username: String, password: String) {
                        if username.lowercased() == "anvitpawar" {
                            wrongUsername = 0
                            if password.lowercased() == "abc12345" {
                                wrongPassword = 0
                                showingNextScreen = true
                            } else {
                                wrongPassword = 2
                            }
                        } else {
                            wrongUsername = 2
                        }
                    }
}
                

                struct ContentView_Previews: PreviewProvider {
                    static var previews: some View {
                        LoginView()
                    }
                }

            
            
            
            
      
