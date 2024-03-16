//
//  SafeAgeApp.swift
//  SafeAge
//
//  Created by user1 on 15/01/24.
//

import SwiftUI
import Firebase

@main

struct SafeAgeApp: App {
    @StateObject var dataManager = DataManager()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
