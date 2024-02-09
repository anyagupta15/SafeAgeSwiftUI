//
//  CallingView.swift
//  SafeAge
//
//  Created by user1 on 16/01/24.
//

import SwiftUI

struct CallingView: View {
    @State private var isMuted = false
    @State private var isSpeakerOn = false
    @State private var isVideoEnabled = true
    @State private var isAddingPerson = false
    @State private var showingNextScreen = false
    
    var body: some View {
        ZStack{
            Color.frontrect.ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Image("bitmoji")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding()
                
                Text("Rohan")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Spacer()
                
                HStack {
                    CallButton(imageName: isVideoEnabled ? "video.fill" : "video.slash.fill", color: .black)                    {
                        isVideoEnabled.toggle()
                    }
                    .frame(width: 100, height: 100)
                    
                    CallButton(imageName: isMuted ? "mic.slash.fill" : "mic.fill", color: .black) {
                        isMuted.toggle()
                    }
                    .frame(width: 100, height: 100)
                    
                    CallButton(imageName: isSpeakerOn ? "speaker.wave.2.fill" : "speaker.wave.2", color: .black) {
                        isSpeakerOn.toggle()
                    }
                    .frame(width: 100, height: 100)
                }
                
                
                HStack{
                    
                    CallButton(imageName: "person.badge.plus", color: .black) {
                        isAddingPerson.toggle()
                    }
                    .sheet(isPresented: $isAddingPerson) {
                        // Add person addition functionality here
                    }
                    .frame(width: 100, height: 100)
                    
                    CallButton(imageName: "phone.down.fill", color: .red) {
                        // Add action for end call button
                        showingNextScreen.toggle()
                    }
                    .frame(width: 100, height: 100)
                    
                    NavigationLink(destination: TabBar(), isActive: $showingNextScreen) {
                        EmptyView()
                    }
                    
                    CallButton(imageName: "keyboard", color: .black) {
                        // Add action for keyboard button
                        
                    }
                    .frame(width: 100, height: 100)
                    
                }
                .padding(.bottom, 20)
            }
            .background(Color.frontrect.opacity(0.2)) // Gray background for the entire page
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .padding()

        }
    }
        
        struct CallButton: View {
            let imageName: String
            let color: Color
            let action: () -> Void
            
            init(imageName: String, color: Color = .black, action: @escaping () -> Void) {
                self.imageName = imageName
                self.color = color
                self.action = action
            }
            
            var body: some View {
                Button(action: action) {
                    Image(systemName: imageName)
                        .font(.title)
                        .padding(20)
                        .background(color)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .frame(width: 70, height: 70) // Ensure all buttons have the same size
                }
            }
        }
    }
    
    struct CallingView_Previews: PreviewProvider {
        static var previews: some View {
            CallingView()
        }
    }


