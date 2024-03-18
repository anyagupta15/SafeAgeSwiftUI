import SwiftUI

struct List2View: View {
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(healthdatafirebasemanager.healthkitfirebase, id: \.id) { userhealthdata1 in
                    VStack(alignment: .leading) {
                        Text("ID: \(userhealthdata1.id)")
                            .font(.headline)
                        Text("Blood Pressure: \(userhealthdata1.bloodPressure)")
                        Text("Heart Rate: \(userhealthdata1.heartRate)")
                        Text("Sleep: \(userhealthdata1.sleep)")
                        Text("Step Count: \(userhealthdata1.stepCount)")
                        Text("Stress: \(userhealthdata1.stress)")
                        Text("Temperature: \(userhealthdata1.temperature)")
                    }
                }
            }
            .navigationTitle("Health Data2")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup){
                newhealth(userID: "xDEgLK4WxkTJmrp1edbO")
                    .environmentObject(healthdatafirebasemanager) // Inject HealthDataFirebaseManager
            }
            .navigationBarItems(trailing: Button(action: {
                healthdatafirebasemanager.fetchData() // Refresh data
            }) {
                Text("Refresh Data")
            })
        }
    }
}

#Preview {
    List2View()
        .environmentObject(HealthDataFirebaseManager())
}
