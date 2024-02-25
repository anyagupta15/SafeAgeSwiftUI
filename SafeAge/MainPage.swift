import SwiftUI
import HealthKit

struct MainPage: View {
    @State private var isActionSheetPresented = false
    @State private var userName = "Rohan"
    @State private var selectedAction: Int? = nil
    @State private var progressValue: Float = 0.5
    @State private var showAlert = false
    @State private var isPresentingdemoView = false
    @State private var isShowingDialog = false
    @State private var showActionButtonMenu = false
    @State private var showingambulancecall  = false
    @State private var showingNextScreen  = false
    @State private var showingHeartRateHistory = false
    @State private var showingmanualFilling = false
    @StateObject private var healthDataManager = HealthDataManager()
    // Set the initial progress value
    var body: some View {
        VStack {
            HStack{
                Text("\(formattedDate())")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 1)
                Spacer()
            }
            
            HStack {
                Text("Hi \(userName)!")
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: {
                    // Show the action sheet when the button is tapped
                    isActionSheetPresented = true
                }) {
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
                            .foregroundColor(Color.red.opacity(0.8))
                        
                        VStack (alignment: .leading, spacing: 10) {
                            HStack {
                                NavigationLink(destination: HeartRateHistoryView(), isActive: $showingHeartRateHistory) {
                                    EmptyView()
                                }
                                .hidden()
                                
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 10)
                            }
                            Text("Heart Rate")
                            .foregroundColor(.white)
                            .font(.title2)
                            
                            }
                            
                           // ProgressView(value: progressValue)
                             //   .progressViewStyle(LinearProgressViewStyle())
                              //  .padding()
                            
                            Text("\(Int(progressValue * 100)) bpm")
                                .foregroundColor(.black)
                                .padding()
                        }
                    padding()
                    }
                    .onTapGesture {
                        showingHeartRateHistory.toggle()
                    }
                }
                
                // Steps
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 150)
                            .foregroundColor(Color.green.opacity(0.8))
                        
                        VStack((alignment: .leading, spacing: 10) )
                        HStack {
                            Image(systemName: "figure.walk")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.trailing, 10)
                        }
                        Text("Steps")
                        .foregroundColor(.white)
                        .font(.title2)
                                    
                            }
                            
                            //ProgressView(value: healthDataManager.stepCountProgress)
                            //    .progressViewStyle(LinearProgressViewStyle())
                              //  .padding()
                            
                            Text("\(healthDataManager.stepCount) Steps")
                                .foregroundColor(.black)
                                .padding()
                        }
            padding()
                    }
                }
            }
            
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
                            .foregroundColor(.white)
                            .font(.title2)
                                //.padding(.trailing, 10)
                            
                            
//                            ProgressView(value: healthDataManager.temperatureProgress)
//                                .progressViewStyle(LinearProgressViewStyle())
//                                .padding()
                            
                            Text("\(Int(healthDataManager.temperature * 100)) C")
                                .foregroundColor(.white)
                                .font(.title3)
                                .padding()
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
                        
                        VStack (alignment: .leading, spacing: 10){
                            HStack {
                                Image(systemName: "drop.triangle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 10)
                            }
                            Text("Blood Pressure")
                            .foregroundColor(.white)
                            .font(.title2)
                            }
                            
                           // ProgressView(value: healthDataManager.bloodPressureProgress)
                               // .progressViewStyle(LinearProgressViewStyle())
                            //    .padding()
                            
                            Text("\(Int(healthDataManager.bloodPressure * 100)) mm/Hg")
                                .foregroundColor(.black)
                                .padding()
                        }
                    padding()
                    }
                }
            }
            
            
            HStack {
                // Sleep
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 150)
                            .foregroundColor(Color.pink.opacity(0.8))
                        
                        VStack (alignment: .leading, spacing: 10){
                            HStack {
                                Image(systemName: "bed.double.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 10)
                            }
                            Text("Sleep")
                            .foregroundColor(.white)
                            .font(.title2)
                            }
                            
                            //ProgressView(value: healthDataManager.sleepProgress)
                              //  .progressViewStyle(LinearProgressViewStyle())
                               // .padding()
                            
                            Text("\(Int(healthDataManager.sleepHours)) hrs")
                                .foregroundColor(.black)
                                .padding()
                        }
                    padding()
                    }
                }
                
                // Stress
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 150)
                            .foregroundColor(Color.green.opacity(0.8))
                        
                        VStack(alignment: .leading, spacing: 10){
                            HStack {
                                Image(systemName: "light.min")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 10)
                            }
                            Text("Stress")
                            .foregroundColor(.white)
                            .font(.title2)
                                                        }
                            
                           // ProgressView(value: healthDataManager.stressProgress)
                               // .progressViewStyle(LinearProgressViewStyle())
                                //.padding()
                            
                            Text("\(Int(healthDataManager.stressLevel)) HRV")
                                .foregroundColor(.black)
                                .padding()
                        }
                    padding()
                    }
                }
            }
           
    
            
            .onAppear {
                            if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 90 {
                                isShowingDialog = true
                            } else if healthDataManager.temperature < 36.1 || healthDataManager.temperature > 37.2 {
                                isShowingDialog = true
                            } else if healthDataManager.bloodPressure > 140 || healthDataManager.bloodPressure < 100 {
                                isShowingDialog = true
                            }else if healthDataManager.stressLevel > 80 {
                                isShowingDialog = true
                            }
                            healthDataManager.requestHealthData()
                        }
                        // Present the dialog when isShowingDialog is true
                        .alert(isPresented: $isShowingDialog) {
                            Alert(
                                title: Text("Alert!"),
                                message: alertMessage(),
                                primaryButton: .default(Text("Action")) {
                                    // Add your action for Button 1
                                    print("Button 1 pressed")
                                    // Show the action sheet
                                    showActionButtonMenu = true
                                },
                                secondaryButton: .destructive(Text("Dismiss")) {
                                    // Add your action for Button 2
                                    print("Dismiss")
                                }
                            )
                        }
            .actionSheet(isPresented: $showActionButtonMenu) {
                ActionSheet(title: Text("Choose an action"), buttons: [
                    .default(Text("Call Ambulance")) {
                        showingambulancecall.toggle()
                        print("Calling ambulance")
                    },
                    .default(Text("Call Saved Contact")) {
                        showingNextScreen.toggle()
                        print("Calling saved contact")
                    },
                    .default(Text("Book Lab Appointment")) {
                        showingmanualFilling.toggle()
                        print("Booking lab appointment")
                    },
                    .cancel()
                ])
            }
            NavigationLink(destination: CallingView(), isActive: $showingNextScreen) {
                EmptyView()
            }
            NavigationLink(destination: AmbulanceCall(), isActive: $showingambulancecall) {
                EmptyView()
            }
            NavigationLink(destination: LabBook(), isActive: $showingmanualFilling) {
                EmptyView()
            }
            // Adjust the bottom padding of the TabView
        
        }
        
        .navigationBarBackButtonHidden(true)
        .padding() // Add padding to the whole VStack
    }
    func formattedDate() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM dd, yyyy"
            return formatter.string(from: Date())
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
        }else {
            return Text("")
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
