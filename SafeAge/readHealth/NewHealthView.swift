//
//  NewDogView.swift
//  SafeAge
//
//  Created by user1 on 16/03/24.
//

import SwiftUI

struct NewHealthView: View {
    @EnvironmentObject var userdatamanager: UserDataManager
    @State private var newbloodPressure = ""
    @State private var newheartRate = ""
    @State private var newsleep = ""
    @State private var newstepCount = ""
    @State private var newstress = ""
    @State private var newtemperature = ""


    
    

    
    
    var body: some View {
        VStack{
            TextField("BloodPressure", text: $newbloodPressure)
                .padding()
            TextField("HeartRate", text: $newheartRate)
                .padding()
            TextField("Sleep", text: $newsleep)
                .padding()
            TextField("StepCount", text: $newstepCount)
                .padding()
            TextField("Stress", text: $newstress)
                .padding()
            TextField("Temperature", text: $newtemperature)
            
            Button {
                userdatamanager.addData(abloodPressure: newbloodPressure, aheartRate: newheartRate, asleep: newsleep, astepCount: newstepCount , astress: newstress, atemperature: newtemperature)
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}
#Preview {
    NewHealthView()
}

