//
//  List2View.swift
//  SafeAge
//
//  Created by user1 on 17/03/24.
//

//
//  List2View.swift
//  SafeAge
//
//  Created by user1 on 17/03/24.
//

import SwiftUI



struct List2View: View {
    
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(healthdatafirebasemanager.healthkitfirebase, id: \.id) { f in
                    VStack(alignment: .leading) {
                        Text("ID: \(f.id)")
                            .font(.headline)
                        Text("Blood Pressure: \(f.bloodPressure)")
                        Text("Heart Rate: \(f.heartRate)")
                        Text("Sleep: \(f.sleep)")
                        Text("Step Count: \(f.stepCount)")
                        Text("Stress: \(f.stress)")
                        Text("Temperature: \(f.temperature)")
                    }
                }
            }
            .navigationTitle("Health Data 2 ")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup){
                newhealth(userID: "xDEgLK4WxkTJmrp1edbO")
                
            }
            
        }
    }
}
#Preview {
    List2View()
        .environmentObject(HealthDataFirebaseManager())
}
