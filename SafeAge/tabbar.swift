//
//  tabbar.swift
//  SafeAge
//
//  Created by user1 on 17/01/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            // Icon 1
            MainPage()
                .tabItem {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 90, height: 50) // Adjust the icon size
                    Text("Home")
                }
            
            // Icon 2
            LabBook()
                .tabItem {
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .frame(width: 50, height: 50) // Adjust the icon size
                    Text("Lab Book")
                }
            
            // Icon3
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 50, height: 50)
                    // Adjust the icon size
                    Text("Settings")
                }
        }
        .navigationBarBackButtonHidden(true)
        //.padding()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

