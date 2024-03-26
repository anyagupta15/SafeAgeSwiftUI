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
    
    @State private var alertDismissed2 = false
    
    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    var body: some View {
            NavigationView {
                VStack {
                    Text("Shared Data")
                    
                //                Button(action: {
                //                    let newData: [String: Any] = [
                //                        "bloodPressure": healthDataManager.bloodPressureSystolic,
                //                        "heartRate": healthDataManager.heartRate,
                //                        "sleep": healthDataManager.sleepHours,
                //                        "stepCount": healthDataManager.stepCount,
                //                        "stress": healthDataManager.stressLevel,
                //                        "temperature": healthDataManager.temperature
                //                    ]
                //                    healthdatafirebasemanager.updateData(id: documentIDManager.documentID, newdata: newData) // Use userID variable
                //                }) {
                //                    Text("Update")
                //                }
                //                .padding()
                
                VStack(spacing: 15) {
                    ForEach(healthdatafirebasemanager.healthkitfirebase, id: \.id) { userhealthdata1 in
                        HStack(spacing: 15) {
                            // Blood PressurexDEgLK4WxkTJmrp1edbO
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
                            
                            // Heart Rate
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
                                    }.padding()
                                }
                            }
                        }
                        .padding(.bottom, 15)
                        
                        HStack(spacing: 15) {
                            // Sleep
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
                            
                            // Step Count
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
                        
                        HStack(spacing: 15) {
                            // Stress
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 150)
                                        .foregroundColor(Color.red.opacity(0.8))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "light.min")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .padding(.trailing, 10)
                                                .foregroundColor(.white)
                                        }
                                        Text("Stress")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        
                                        
                                        Text("\(userhealthdata1.stress) HRV")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                    }
                                    .padding()
                                }
                            }
                            
                            // Temperature
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
                        }
                        .padding(.bottom, 30)
                    }
                }
                
                
                //                List {
                //                    ForEach(healthdatafirebasemanager.healthkitfirebase, id: \.id) { userhealthdata1 in
                //                        VStack(alignment: .leading) {
                //                            Text("ID: \(userhealthdata1.id)")
                //                                .font(.headline)
                //                            Text("Blood Pressure: \(userhealthdata1.bloodPressure)")
                //                            Text("Heart Rate: \(userhealthdata1.heartRate)")
                //                            Text("Sleep: \(userhealthdata1.sleep)")
                //                            Text("Step Count: \(userhealthdata1.stepCount)")
                //                            Text("Stress: \(userhealthdata1.stress)")
                //                            Text("Temperature: \(userhealthdata1.temperature)")
                //                        }
                //                    }
                //                }
                                .navigationTitle("Family Sharing")
                
                //                .navigationBarItems(trailing: Button(action: {
                //                    showPopup.toggle()
                //                }, label: {
                //                    Image(systemName: "plus")
                //                }))
                //                .sheet(isPresented: $showPopup) {
                //                    newhealth(userID: documentIDManager.documentID)
                //                        .environmentObject(healthdatafirebasemanager)
                //                }
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
                            UserDefaults.standard.set(true, forKey: "alertDismissed")
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
                        //  .default(Text("Book Lab Appointment")) {
                        //   showingmanualFilling.toggle()
                        //   // Check if other properties should be updated here
                        //  print("Booking lab appointment")
                        // },
                        .cancel()
                    ])
                }
                
                .sheet(isPresented: $isCallingView3Presented) {
                    CallingView2()
                }
//                .onAppear {
//                    isShowingDialog2 = true
//                }
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


    
    func generateHealthDataLink() -> String? {
        // Generate the link with actual health data
        let heartRate = healthDataManager.heartRate
        let steps = healthDataManager.stepCount
        // You can include more health data properties as needed
        // Example link format: "https://example.com/healthdata?heartRate=70&steps=5000"
        let link = "https://example.com/healthdata?heartRate=\(heartRate)&steps=\(steps)"
        return link
    }
    
    struct List2View_Previews: PreviewProvider {
        static var previews: some View {
            List2View()
            //            @EnvironmentObject var documentIDManager: DocumentIDManager
            //            newhealth(userID: documentIDManager.documentID) // Initialize without passing any arguments
            //                .environmentObject(HealthDataManager())
            //                .environmentObject(DocumentIDManager()) // Inject DocumentIDManager
        }
    }
}
