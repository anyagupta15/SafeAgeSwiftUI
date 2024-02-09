//
//  signup_page.swift
//  SafeAge
//
//  Created by user1 on 16/01/24.
//

import SwiftUI

struct signup_page: View {
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
                
                Button{
                    
                }label:{
                    HStack{
                        Image("google").resizable().scaledToFit().ignoresSafeArea()
                    }
                }
                .foregroundColor(.black)
                .frame(width: 400 , height: 60)
                .background(Color.white)
                .cornerRadius(10)
                
                Text("-----------------OR --------------------")
                
                
                
                TextField("Email ", text: $email)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                TextField("Password ", text: $password)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(.top,3)
                
                TextField("Confirm Password ", text: $password)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(.top,3)
                    .padding(.bottom,5)
                
                Button("Sign Up") {
                    showingNextScreen.toggle()
                }
                .foregroundColor(.white)
                .frame(width: 201, height: 44)
                .background(Color.blue)
                .cornerRadius(10)
                //.padding(.top, 20)
                
                NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                    EmptyView()
                }
                
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
