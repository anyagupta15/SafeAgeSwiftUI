import SwiftUI

struct List1View: View {
    @EnvironmentObject var userdatamanager: UserDataManager
    @State private var showPopup = false

    var body: some View {
        NavigationView{
            List {
                ForEach(userdatamanager.userhealthdata, id: \.id) { userhealthdata1 in
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
            .navigationTitle("Health Data")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup){
                NewHealthView(userID: "CqTjNqnrkK08KE6vVGzN")
            }
        }
    }
}

#Preview {
    List1View()
        .environmentObject(UserDataManager())
}

