//import SwiftUI
//
//struct NewHealthView: View {
//    @EnvironmentObject var userdatamanager: UserDataManager
//    @State private var newbloodPressure = ""
//    @State private var newheartRate = ""
//    @State private var newsleep = ""
//    @State private var newstepCount = ""
//    @State private var newstress = ""
//    @State private var newtemperature = ""
//    
//    let userID: String // Variable to hold the user ID
//
//    var body: some View {
//        VStack{
//            TextField("Blood Pressure", text: $newbloodPressure)
//                .padding()
//            TextField("Heart Rate", text: $newheartRate)
//                .padding()
//            TextField("Sleep", text: $newsleep)
//                .padding()
//            TextField("Step Count", text: $newstepCount)
//                .padding()
//            TextField("Stress", text: $newstress)
//                .padding()
//            TextField("Temperature", text: $newtemperature)
//                .padding()
//            
//            Button(action: {
//                userdatamanager.addData(abloodPressure: newbloodPressure, aheartRate: newheartRate, asleep: newsleep, astepCount: newstepCount , astress: newstress, atemperature: newtemperature)
//            }) {
//                Text("Save")
//            }
//            .padding()
//
//            Button(action: {
//                let newData: [String: Any] = [
//                    "bloodPressure": newbloodPressure,
//                    "heartRate": newheartRate,
//                    "sleep": newsleep,
//                    "stepCount": newstepCount,
//                    "stress": newstress,
//                    "temperature": newtemperature
//                ]
//                userdatamanager.updateData(id: userID, newData: newData) // Use userID variable
//            }) {
//                Text("Update")
//            }
//            .padding()
//        }
//        .padding()
//    }
//}
//
//struct NewHealthView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewHealthView(userID: "CqTjNqnrkK08KE6vVGzN") // Pass the userID here
//    }
//}
