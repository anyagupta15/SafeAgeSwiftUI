//
//  enterDocId.swift
//  SafeAge
//
//  Created by user1 on 26/03/24.
//

import SwiftUI

struct enterDocId: View {
    
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @State private var showPopup = false
    @EnvironmentObject var documentIDManager: DocumentIDManager
    @State private var link: String = "xDEgLK4WxkTJmrp1edbO" // State variable to hold the link
    @EnvironmentObject var healthDataManager: HealthDataManager
    
    var body: some View {
        NavigationView {
            
            VStack {
                //AuthView()
                TextField("Enter User A Code Here", text: $documentIDManager.documentID)
                
                
            }
            .navigationBarItems(trailing: Button(action: {
                healthdatafirebasemanager.fetchData(documentID: documentIDManager.documentID)
            }) {
                Text("Refresh Data")
            })
        }
    }
    }


#Preview {
    enterDocId()
}
