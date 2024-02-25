import SwiftUI
import HealthKit

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


    @StateObject private var healthDataManager = HealthDataManager()
    
    var body: some View {
        VStack {
            HStack{
                Text("\(formattedDate())")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 1)
                Spacer()
                Button(action: {
                                        // Generate and share link action
                                        // Add your logic here to generate and share the link
                                        shareLink()
                                    }) {
                                        Image(systemName: "square.and.arrow.up")
                                            .font(.title)
                                            .foregroundColor(.blue)
                                    }
                                    .padding(.trailing, 20)
            }
            
            HStack {
                
                Text("Hi Rani !")
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
                            
                            Text("\(Int(progressValue * 100)) bpm")
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
                                    .frame(width: 40, height: 40)
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
                            
                            Text("Temp")
                                .bold()
                                .foregroundColor(.white)
                                .font(.title2)
                            
                            Text("\(Int(healthDataManager.temperature * 100)) C")
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
                                .font(.title2)
                            
                            
                            Text("\(Int(healthDataManager.bloodPressure * 100)) mm/Hg")
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
                                    .frame(width: 40, height: 40)
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
        .onAppear {
            if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 90 ||
               healthDataManager.temperature < 36.1 || healthDataManager.temperature > 37.2 ||
               healthDataManager.bloodPressure > 140 || healthDataManager.bloodPressure < 100 ||
               healthDataManager.stressLevel > 80 {
                isShowingDialog = true
                
            }
            healthDataManager.requestHealthData()
        }
        .alert(isPresented: $isShowingDialog) {
            Alert(
                title: Text("Alert!"),
                message: alertMessage(),
                primaryButton: .default(Text("Action")) {
                    showActionButtonMenu = true
                },
                secondaryButton: .destructive(Text("Dismiss")) {
                    print("Dismiss")
                }
            )
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
 
        
//        NavigationLink(destination: CallingView2(), isActive: $navigateToSharingView) {
//            EmptyView()
//        }



        

        .navigationBarBackButtonHidden(true)
        .padding() // Add padding to the whole VStack
    }
    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: Date())
    }
    func shareLink() {
        // Generate the link to be shared
        let sharedLink = "https://example.com/your-data" // Replace with your actual link
        
        // Create an instance of UIActivityViewController
        let activityViewController = UIActivityViewController(activityItems: [sharedLink], applicationActivities: nil)
        
        // Configure activityViewController
        activityViewController.excludedActivityTypes = [.addToReadingList, .airDrop] // Exclude specific activities if needed
        
        // Present the UIActivityViewController
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }

    
    func alertMessage() -> Text {
        if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 90 {
            return Text("Heart Rate is out of normal range.")
        } else if healthDataManager.temperature < 36.1 || healthDataManager.temperature > 37.2 {
            return Text("Temperature is out of normal range.")
        } else if healthDataManager.bloodPressure > 140 || healthDataManager.bloodPressure < 100 {
            return Text("Blood Pressure is out of normal range.")
        } else if healthDataManager.stressLevel > 80 {
            return Text("Stress level is high.")
        } else {
            return Text("")
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}


