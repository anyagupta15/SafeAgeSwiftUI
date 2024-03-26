import SwiftUI
import HealthKit
import Combine
import UserNotifications

struct MainPage: View {
    
    @State private var isActionSheetPresented = false
    @State private var userName = "Rohan"
    @State private var progressValue: Float = 0.5
    @State private var isShowingDialog = false
    @State private var showActionButtonMenu = false
    @State private var showingambulancecall = false
    @State private var showingNextScreen = false
    @State private var showingHeartRateHistory = false
    @State private var showingmanualFilling = false
    @State private var showingcallingview2 = false
    @State private var isCallingView2Presented = false
    
    @State private var alertDismissed = false
    //let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    @State private var currentTime = Date()
    
    @StateObject private var healthDataManager = HealthDataManager()
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    
    @EnvironmentObject var documentIDManager: DocumentIDManager
    var body: some View {
        
        NavigationView { // Wrapping content in NavigationView
            VStack {
                HStack{
                    Text("\(formattedDate())")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 1)
                    Spacer()
                    Button(action: {
                        // Fetch the latest health data and update the properties
                        healthDataManager.requestHealthData()
                        
                        // Construct the new data dictionary
                        let newData: [String: Any] = [
                            "bloodPressure": healthDataManager.bloodPressureSystolic,
                            "bpd":healthDataManager.bloodPressureDiastolic,
                            "heartRate": healthDataManager.heartRate,
                            "sleep": healthDataManager.sleepHours,
                            "stepCount": healthDataManager.stepCount,
                            "stress": healthDataManager.stressLevel,
                            "temperature": healthDataManager.temperature
                        ]
                        
                        // Update the data in the Firebase manager
                        healthdatafirebasemanager.updateData(id: "xDEgLK4WxkTJmrp1edbO", newdata: newData)
                    }) {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(.trailing, -10)
                        
                    }

                    .padding()
                }
                
                HStack {
                    
//                    Text("Hi Rani !")
                    Text("Greetings!")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    
                    .actionSheet(isPresented: $isActionSheetPresented) {
                        ActionSheet(title: Text("Select a Profile View"), buttons: [
                            .default(Text("Priya")) {
                                userName = "Priya"
                                // Add your action for Priya
                            },
                            .default(Text("Rohan")) {
                                userName = "Rohan"
                                // Add your action for Rohan
                            },
                            .default(Text("Add Account")) {
                                // Add your action for the third option
                            },
                            .cancel()
                        ])
                    }
                    .padding(.bottom, 10)
                    
                }
                
                HStack {
                    // Heart Rate
                    VStack {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 150)
                                .foregroundColor(Color.green.opacity(0.8))
                            
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    NavigationLink(destination: HeartRateHistoryView(), isActive: $showingHeartRateHistory) {
                                        EmptyView()
                                    }
                                    .hidden()
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
                                
                                //  .padding()
                                
                                Text("\(Int(healthDataManager.heartRate)) bpm")
                                    .foregroundColor(.white)
                                // .padding()
                                    .font(.title3)
                            }.padding()
                        }
                        .onTapGesture {
                            showingHeartRateHistory.toggle()
                        }
                    }
                    
                    
                    
                    // Steps
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
                                Text("Steps")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.title2)
                                
                                
                                Text("\(healthDataManager.stepCount) ")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                //.padding()
                                
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 15)
                
                HStack {
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
                                
                                Text("\(Int(healthDataManager.temperature )) C")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                //.padding()
                            }
                            .padding()
                        }
                    }
                    // Blood Pressure
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
                                
                                
                                Text("\(Int(healthDataManager.bloodPressureSystolic))/\(Int(healthDataManager.bloodPressureDiastolic)) mmHg")
                                
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 15)
                
                HStack {
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
                                
                                
                                Text("\(Int(healthDataManager.sleepHours)) hrs")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                //.padding()
                            }
                            .padding()
                        }
                    }
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
                                
                                
                                Text("\(Int(healthDataManager.stressLevel)) HRV")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                //.padding()
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 30)
                
                
            }
            // Hiding the back button
            .navigationBarHidden(true)
//            .onReceive(timer) { input in
//                            // This closure will be executed every minute
//                            self.currentTime = input
//                healthDataManager.requestHealthData()
//                
//                // Construct the new data dictionary
//                let newData: [String: Any] = [
//                    "bloodPressure": healthDataManager.bloodPressureSystolic,
//                    "bpd":healthDataManager.bloodPressureDiastolic,
//                    "heartRate": healthDataManager.heartRate,
//                    "sleep": healthDataManager.sleepHours,
//                    "stepCount": healthDataManager.stepCount,
//                    "stress": healthDataManager.stressLevel,
//                    "temperature": healthDataManager.temperature
//                ]
//                            // Call your function here
//                healthdatafirebasemanager.updateData(id: documentIDManager.documentID, newdata: newData)
//                        
//                        }
            
//            Button(action: {
//                showingmanualFilling = true
//            }) {
//                Text("Open New Health View")
//            }
//            .sheet(isPresented: $showingmanualFilling) {
//                newhealth(userID: "YourUserID")
//                    .environmentObject(healthDataManager)
//            }
            // .navigationBarBackButtonHidden(true)
          
//
//            .onAppear {
//                if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 90 || healthDataManager.temperature < Int(36.1) || healthDataManager.temperature > Int(37.2) || healthDataManager.bloodPressureSystolic > 140 || healthDataManager.bloodPressureSystolic < 100 || healthDataManager.stressLevel > 80 {
//                    isShowingDialog = true
//                }
//                healthDataManager.requestHealthData()
//            }
            .onAppear {
                healthDataManager.requestHealthData()
                
                
                
                // Show the alert only if it hasn't been dismissed before
                if !alertDismissed {
                    isShowingDialog = true
                }
            }
            .alert(isPresented: $isShowingDialog) {
                let alert = Alert(
                    title: Text("Alert!"),
                    message: Text(alertMessage()),

                    primaryButton: .default(Text("Action")) {
                        showActionButtonMenu = true
                    },
                    secondaryButton: .destructive(Text("Dismiss")) {
                        // Dismiss the alert and set isShowingDialog to false
                        isShowingDialog = false
                        alertDismissed = true
                        UserDefaults.standard.set(true, forKey: "alertDismissed")
                    }
                )
                
              
                return alert
            }

            .actionSheet(isPresented: $showActionButtonMenu) {
                ActionSheet(title: Text("Choose an action"), buttons: [
                    .default(Text("Call Ambulance")) {
                        // Check if other properties should be updated here
                        isCallingView2Presented = true
                        print("Calling ambulance")
                    },
                    .default(Text("Call Saved Contact")) {
                        // Check if other properties should be updated here
                        isCallingView2Presented = true
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
            .sheet(isPresented: $isCallingView2Presented) {
                CallingView2()
            }
            .padding()
        }
        .navigationBarHidden(true)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in }
    }
    
  

    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: Date())
    }
    
    func shareLink() {
        // Generate the link to be shared
        if let healthDataLink = generateHealthDataLink() {
            // Create an instance of UIActivityViewController
            let activityViewController = UIActivityViewController(activityItems: [healthDataLink], applicationActivities: nil)
            // Configure activityViewController
            activityViewController.excludedActivityTypes = [.addToReadingList, .airDrop] // Exclude specific activities if needed
            // Present the UIActivityViewController
            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
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
    
    
    func alertMessage() -> String {
        if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 90 {
            return "Heart Rate is out of normal range."
        } else if healthDataManager.temperature < Int(36.1) || healthDataManager.temperature > Int(37.2) {
            return "Temperature is out of normal range."
        } else if healthDataManager.bloodPressureSystolic > 140 || healthDataManager.bloodPressureSystolic < 100 {
            return "Blood Pressure is out of normal range."
        } else if healthDataManager.stressLevel > 80 {
            return "Stress level is high."
        } else {
            return ""
        }
    }

    

}



struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
        @EnvironmentObject var documentIDManager: DocumentIDManager
       newhealth(userID: "documentIDManager.documentID") // Initialize without passing any arguments
           .environmentObject(HealthDataManager())
           .environmentObject(DocumentIDManager()) // Inject DocumentIDManager
    }
}
