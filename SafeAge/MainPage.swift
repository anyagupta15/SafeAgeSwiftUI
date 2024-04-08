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
    @State private var currentTime = Date()


    @StateObject private var healthDataManager = HealthDataManager()
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @EnvironmentObject var documentIDManager: DocumentIDManager

    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("\(formattedDate())")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 1)
                    Spacer()
                    Button(action: {
                        healthDataManager.requestHealthData()

                        let newData: [String: Any] = [
                            "bloodPressure": healthDataManager.bloodPressureSystolic,
                            "bpd":healthDataManager.bloodPressureDiastolic,
                            "heartRate": healthDataManager.heartRate,
                            "sleep": healthDataManager.sleepHours,
                            "stepCount": healthDataManager.stepCount,
                            "stress": healthDataManager.respiratoryRate,
                            "temperature": healthDataManager.temperature
                        ]

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
                            },
                            .default(Text("Rohan")) {
                                userName = "Rohan"
                            },
                            .default(Text("Add Account")) {
                            },
                            .cancel()
                        ])
                    }
                    .padding(.bottom, 10)

                }

                HStack {
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

                                Text("\(Int(healthDataManager.heartRate)) bpm")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }.padding()
                        }
                        .onTapGesture {
                            showingHeartRateHistory.toggle()
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
                                Text("Steps")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.title2)


                                Text("\(healthDataManager.stepCount) ")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 15)

                HStack {
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
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 10)
                                        .foregroundColor(.white)
                                }
                                Text("Respiratory Rate")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.title3)


                                Text("\(Int(healthDataManager.respiratoryRate))/min")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.bottom, 30)


            }
            .navigationBarHidden(true)
            .onAppear {
                healthDataManager.requestHealthData()

                if UserDefaults.standard.bool(forKey: "alertDismissed") {
                    alertDismissed = true
                }
                showHealthAlertIfNeeded() // Call this function to determine whether to show the alert or not
            }

            .alert(isPresented: $isShowingDialog) {
                let alert = Alert(
                    title: Text("Alert!"),
                    message: Text(alertMessage()),
                    primaryButton: .default(Text("Action")) {
                        showActionButtonMenu = true
                    },
                    secondaryButton: .destructive(Text("Dismiss")) {
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
                        isCallingView2Presented = true
                        print("Calling ambulance")
                    },
                    .default(Text("Call Saved Contact")) {
                        isCallingView2Presented = true
                        print("Calling saved contact")
                    },
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

    func showHealthAlertIfNeeded() {
        if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 100 ||
            healthDataManager.temperature < Int(36.1) || healthDataManager.temperature > Int(37.2) ||
            healthDataManager.bloodPressureSystolic > 140 || healthDataManager.bloodPressureSystolic < 100 ||
            healthDataManager.bloodPressureDiastolic < 80 || healthDataManager.bloodPressureDiastolic > 100 ||
            healthDataManager.respiratoryRate < 11 || healthDataManager.respiratoryRate > 16 {
            isShowingDialog = true
        } else {
            isShowingDialog = false
        }
    }


    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: Date())
    }

    func alertMessage() -> String {
        if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 100 {
            return "Heart Rate is out of normal range."
        } else if healthDataManager.temperature < Int(36.1) || healthDataManager.temperature > Int(37.2) {
            return "Temperature is out of normal range."
        } else if healthDataManager.bloodPressureSystolic > 140 || healthDataManager.bloodPressureSystolic < 100 || healthDataManager.bloodPressureDiastolic < 75 || healthDataManager.bloodPressureDiastolic > 100 {
            return "Blood Pressure is out of normal range."
        } else if healthDataManager.respiratoryRate < 12 || healthDataManager.respiratoryRate > 16 {
            return "Respiratory Rate is low."
        } else {
            return ""
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
            .environmentObject(HealthDataManager())
//            .environmentObject(HealthDataFirebaseManager())
            .environmentObject(DocumentIDManager())
    }
}

