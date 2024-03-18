import SwiftUI
import HealthKit

struct newhealth: View {
    @EnvironmentObject var healthDataManager: HealthDataManager
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @State private var newbloodPressure = ""
    @State private var newheartRate = ""
    @State private var newsleep = ""
    @State private var newstepCount = ""
    @State private var newstress = ""
    @State private var newtemperature = ""
    //@Environment var nid: String = ""
    
    let userID: String // Variable to hold the user ID
    
    var body: some View {
        VStack {
            TextField("Blood Pressure", text: $newbloodPressure)
                .padding()
            TextField("Heart Rate", text: $newheartRate)
                .padding()
            TextField("Sleep", text: $newsleep)
                .padding()
            TextField("Step Count", text: $newstepCount)
                .padding()
            TextField("Stress", text: $newstress)
                .padding()
            TextField("Temperature", text: $newtemperature)
                .padding()
           // TextField("User", text: $nid)
            
            Button(action: {
                            let newData: [String: Any] = [
                                "bloodPressure": healthDataManager.bloodPressure,
                                "heartRate": healthDataManager.heartRate,
                                "sleep": healthDataManager.sleepHours,
                                "stepCount": healthDataManager.stepCount,
                                "stress": healthDataManager.stressLevel,
                                "temperature": healthDataManager.temperature
                            ]
                healthdatafirebasemanager.updateData(id: "xDEgLK4WxkTJmrp1edbO", newdata: newData) // Use userID variable
                        }) {
                            Text("Update")
            }
            .padding()
            
            Button(action: {
                // Print the collected data from HealthKit
                print("Heart Rate: \(healthDataManager.heartRate)")
                print("Step Count: \(healthDataManager.stepCount)")
                print("Stress: \(healthDataManager.stressLevel)")
                print("Sleep: \(healthDataManager.sleepHours)")
                print("Temperature: \(healthDataManager.temperature)")
                print("Blood Pressure: \(healthDataManager.bloodPressure)")
                // Print other data properties as needed
            }) {
                Text("Print Data")
            }
            .padding()
        }
        .padding()
    }
}

struct newhealth_Previews: PreviewProvider {
    static var previews: some View {
        newhealth(userID: "xDEgLK4WxkTJmrp1edbO")
            .environmentObject(HealthDataManager())
            
    }
}

