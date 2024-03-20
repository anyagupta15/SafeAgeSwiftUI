import SwiftUI

struct List2View: View {
    @EnvironmentObject var healthdatafirebasemanager: HealthDataFirebaseManager
    @State private var showPopup = false
    @EnvironmentObject var documentIDManager: DocumentIDManager
    @State private var link: String = "xDEgLK4WxkTJmrp1edbO" // State variable to hold the link
    @EnvironmentObject var healthDataManager: HealthDataManager
   
    var body: some View {
        NavigationView{
            VStack {
                TextField("Enter document id", text: $documentIDManager.documentID)
                    .padding()
                
                Button(action: {
                                let newData: [String: Any] = [
                                    "bloodPressure": healthDataManager.bloodPressureSystolic,
                                    "heartRate": healthDataManager.heartRate,
                                    "sleep": healthDataManager.sleepHours,
                                    "stepCount": healthDataManager.stepCount,
                                    "stress": healthDataManager.stressLevel,
                                    "temperature": healthDataManager.temperature
                                ]
                    healthdatafirebasemanager.updateData(id: documentIDManager.documentID, newdata: newData) // Use userID variable
                            }) {
                                Text("Update")
                }
                .padding()
                
                VStack(spacing: 15) {
                    ForEach(healthdatafirebasemanager.healthkitfirebase, id: \.id) { userhealthdata1 in
                        HStack(spacing: 15) {
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
                                        
                                        Text("\(userhealthdata1.bloodPressure)")
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
                .sheet(isPresented: $showPopup) {
                    newhealth(userID: documentIDManager.documentID)
                        .environmentObject(healthdatafirebasemanager)
                }
                .navigationBarItems(trailing: Button(action: {
                    healthdatafirebasemanager.fetchData(documentID: documentIDManager.documentID)
                }) {
                    Text("Refresh Data")
                })
            }
        }
    }
}

struct List2View_Previews: PreviewProvider {
    static var previews: some View {
        @EnvironmentObject var documentIDManager: DocumentIDManager
        newhealth(userID: documentIDManager.documentID) // Initialize without passing any arguments
            .environmentObject(HealthDataManager())
            .environmentObject(DocumentIDManager()) // Inject DocumentIDManager
    }
}
