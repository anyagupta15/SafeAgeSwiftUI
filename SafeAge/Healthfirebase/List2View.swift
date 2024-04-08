import SwiftUI

struct List2View: View {
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @State private var showPopup = false
    @EnvironmentObject var documentIDManager: DocumentIDManager
    @State private var link: String = "xDEgLK4WxkTJmrp1edbO" // State variable to hold the link
    @EnvironmentObject var healthDataManager: HealthDataManager
    
    @State private var isCallingView3Presented = false
    
    @State private var isShowingDialog2 = false
    @State private var showActionButtonMenu2 = false
    
    @State private var alertDismissed2: Bool = UserDefaults.standard.bool(forKey: "alertDismissed2")
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Shared Data")
                
                VStack(spacing: 15) {
                    ForEach(healthdatafirebasemanager.healthkitfirebase, id: \.id) { userhealthdata1 in
                        HStack(spacing: 15) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.green.opacity(0.8))
                                    
                                    VStack (alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "heart.circle.fill")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(.white)
                                                .padding(.trailing, 10)
                                        }
                                        Text("Heart Rate")
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.title2)
                                        
                                        Text("\(userhealthdata1.heartRate)")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.purple.opacity(0.8))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "figure.walk")
                                                .resizable()
                                                .frame(width: 33, height: 40)
                                                .foregroundColor(.white)
                                                .padding(.trailing, 10)
                                        }
                                        Text("Step Count")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        
                                        Text("\(userhealthdata1.stepCount)")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding(.bottom, 15)
                        .padding([.leading, .trailing], 10) // Add padding to the sides
                        
                        HStack(spacing: 15) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.blue.opacity(0.8))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "thermometer")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(.white)
                                                .padding(.trailing, 10)
                                        }
                                        
                                        Text("Temperature")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        
                                        Text("\(userhealthdata1.temperature) C")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                            
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.orange.opacity(0.8))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "drop.triangle.fill")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(.white)
                                                .padding(.trailing, 10)
                                        }
                                        Text("Blood Pressure")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title3)
                                        HStack{
                                            Text("\(userhealthdata1.bloodPressure)")
                                            Text("/")
                                            Text("\(userhealthdata1.bpd)")
                                        }
                                        
                                        .foregroundColor(.white)
                                        .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding(.bottom, 15)
                        .padding([.leading, .trailing], 10) // Add padding to the sides
                        
                        HStack(spacing: 15) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.pink.opacity(0.8))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "bed.double.circle.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.trailing, 10)
                                                .foregroundColor(.white)
                                        }
                                        Text("Sleep")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        
                                        Text("\(userhealthdata1.sleep) hrs")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                            
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.red.opacity(0.8))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "lungs.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.trailing, 10)
                                                .foregroundColor(.white)
                                        }
                                        Text("Respiratory Rate")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        
                                        
                                        Text("\(userhealthdata1.stress) %")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding(.bottom, 30)
                        .padding([.leading, .trailing], 10) // Add padding to the sides
                    }
                }
                .navigationTitle("Family Sharing")
                .navigationBarItems(trailing: Button(action: {
                    showPopup.toggle()
                }) {
                    Text("Add Another")
                })
                .sheet(isPresented: $showPopup) {
                    // Present the sheet containing enterDocID() functionality
                    enterDocId()
                };
                
            }
            .onReceive(timer) { _ in
                // Call fetchData every 30 seconds
                healthdatafirebasemanager.fetchData(documentID: documentIDManager.documentID)
            }
            .onAppear {
                if !alertDismissed2 {
                    isShowingDialog2 = true
                }
            }
            .alert(isPresented: $isShowingDialog2) {
                let defaultHealthData = healthdata(id: "", bloodPressure: 0, bpd: 0, heartRate: 0, sleep: 0, stepCount: 0, stress: 0, temperature: 0) // Create a default health data object with default values
                let alert = Alert(
                    title: Text("Alert!"),
                    message: Text(alertMessage2(userhealthdata1: healthdatafirebasemanager.healthkitfirebase.first ?? defaultHealthData)), // Pass the default health data object
                    primaryButton: .default(Text("Action")) {
                        showActionButtonMenu2 = true
                    },
                    secondaryButton: .destructive(Text("Dismiss")) {
                        // Dismiss the alert and set isShowingDialog to false
                        isShowingDialog2 = false
                        alertDismissed2 = true
                        UserDefaults.standard.set(true, forKey: "alertDismissed2") // Change UserDefaults key
                    }
                )
                return alert
            }
            .actionSheet(isPresented: $showActionButtonMenu2) {
                ActionSheet(title: Text("Choose an action"), buttons: [
                    .default(Text("Call Ambulance")) {
                        // Check if other properties should be updated here
                        isCallingView3Presented = true
                        print("Calling ambulance")
                    },
                    .default(Text("Call Saved Contact")) {
                        // Check if other properties should be updated here
                        isCallingView3Presented = true
                        print("Calling saved contact")
                    },
                    .cancel()
                ])
            }
            .sheet(isPresented: $isCallingView3Presented) {
                CallingView2()
            }
        }
    }
    
    func alertMessage2(userhealthdata1: healthdata) -> String {
        if userhealthdata1.heartRate < 60 || userhealthdata1.heartRate > 90 {
            return "Heart Rate is out of normal range."
        } else if userhealthdata1.temperature < 36 || userhealthdata1.temperature > 37{
            return "Temperature is out of normal range."
        } else if userhealthdata1.bloodPressure > 140 || userhealthdata1.bloodPressure < 100 {
            return "Blood Pressure is out of normal range."
        } else if userhealthdata1.stress > 80 {
            return "Stress level is high."
        } else {
            return ""
        }
    }
    
    struct List2View_Previews: PreviewProvider {
        static var previews: some View {
            List2View()
        }
    }
}
