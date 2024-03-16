////
////  SecondUser.swift
////  SafeAge
////
////  Created by user1 on 16/03/24.
////
//
//import SwiftUI
//
//struct SecondUser: View {
//    @EnvironmentObject var userdatamanager: UserDataManager
//    @State private var showPopup = false
//    
//    @State private var isActionSheetPresented = false
//    @State private var userName = "Rohan"
//    @State private var progressValue: Float = 0
//    @State private var isShowingDialog = false
//    @State private var showActionButtonMenu = false
//    @State private var showingHeartRateHistory = false
//    @State private var showingmanualFilling = false
//    @State private var showingcallingview2 = false
//    @State private var isCallingView2Presented = false
//    
//    var body: some View {
//        NavigationView {
//            ForEach(userdatamanager.userhealthdata, id: \.id) { userhealthdata1 in
//                VStack(alignment: .leading) {
//                    HStack{
//                        Text("\(formattedDate())")
//                            .font(.title)
//                            .bold()
//                            .padding(.bottom, 1)
//                        Spacer()
//                    }
//                    
//                    HStack {
//                        Text("Mom")
//                            .font(.title)
//                            .bold()
//                        Spacer()
//                        NavigationLink(destination: SettingsView()) {
//                            Image(systemName: "person.crop.circle.fill")
//                                .font(.title)
//                                .foregroundColor(.blue)
//                        }
//                        .actionSheet(isPresented: $isActionSheetPresented) {
//                            ActionSheet(title: Text("Select a Profile View"), buttons: [
//                                .default(Text("Priya")) {
//                                    userName = "Priya"
//                                    // Add your action for Priya
//                                },
//                                .default(Text("Rohan")) {
//                                    userName = "Rohan"
//                                    // Add your action for Rohan
//                                },
//                                .default(Text("Add Account")) {
//                                    // Add your action for the third option
//                                },
//                                .cancel()
//                            ])
//                        }
//                        .padding(.bottom, 10)
//                    }
//                    
//                    HStack {
//                        VStack {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .frame(height: 150)
//                                    .foregroundColor(Color.green.opacity(0.8))
//                                
//                                VStack (alignment: .leading, spacing: 10) {
//                                    HStack {
//                                        NavigationLink(destination: HeartRateHistoryView(), isActive: $showingHeartRateHistory) {
//                                            EmptyView()
//                                        }
//                                        .hidden()
//                                        Spacer()
//                                        Image(systemName: "heart.circle.fill")
//                                            .resizable()
//                                            .frame(width: 40, height: 40)
//                                            .foregroundColor(.white)
//                                            .padding(.trailing, 10)
//                                    }
//                                    Text("Heart Rate")
//                                        .foregroundColor(.white)
//                                        .bold()
//                                        .font(.title2)
//                                    
//                                    Text("0 bpm")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                }.padding()
//                            }
//                            .onTapGesture {
//                                showingHeartRateHistory.toggle()
//                            }
//                        }
//                        
//                        VStack {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .frame(height: 150)
//                                    .foregroundColor(Color.purple.opacity(0.8))
//                                
//                                VStack(alignment: .leading, spacing: 10) {
//                                    HStack {
//                                        Spacer()
//                                        Image(systemName: "figure.walk")
//                                            .resizable()
//                                            .frame(width: 33, height: 40)
//                                            .foregroundColor(.white)
//                                            .padding(.trailing, 10)
//                                    }
//                                    Text("Steps")
//                                        .bold()
//                                        .foregroundColor(.white)
//                                        .font(.title2)
//                                    
//                                    Text("0")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                }
//                                .padding()
//                            }
//                        }
//                    }
//                    .padding(.bottom, 15)
//                    
//                    HStack {
//                        VStack {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .frame(height: 150)
//                                    .foregroundColor(Color.blue.opacity(0.8))
//                                
//                                VStack(alignment: .leading, spacing: 10) {
//                                    HStack {
//                                        Spacer()
//                                        Image(systemName: "thermometer")
//                                            .resizable()
//                                            .frame(width: 40, height: 40)
//                                            .foregroundColor(.white)
//                                            .padding(.trailing, 10)
//                                    }
//                                    
//                                    Text("Temperature")
//                                        .bold()
//                                        .foregroundColor(.white)
//                                        .font(.title2)
//                                    
//                                    Text("0 C")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                }
//                                .padding()
//                            }
//                        }
//                        
//                        VStack {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .frame(height: 150)
//                                    .foregroundColor(Color.orange.opacity(0.8))
//                                
//                                VStack(alignment: .leading, spacing: 10) {
//                                    HStack {
//                                        Spacer()
//                                        Image(systemName: "drop.triangle.fill")
//                                            .resizable()
//                                            .frame(width: 40, height: 40)
//                                            .foregroundColor(.white)
//                                            .padding(.trailing, 10)
//                                    }
//                                    Text("Blood Pressure")
//                                        .bold()
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                    
//                                    Text("0 mm/Hg")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                    
//                                }
//                                .padding()
//                            }
//                        }
//                    }
//                    .padding(.bottom, 15)
//                    
//                    HStack {
//                        VStack {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .frame(height: 150)
//                                    .foregroundColor(Color.pink.opacity(0.8))
//                                
//                                VStack(alignment: .leading, spacing: 10) {
//                                    HStack {
//                                        Spacer()
//                                        Image(systemName: "bed.double.circle.fill")
//                                            .resizable()
//                                            .frame(width: 30, height: 30)
//                                            .padding(.trailing, 10)
//                                            .foregroundColor(.white)
//                                    }
//                                    Text("Sleep")
//                                        .bold()
//                                        .foregroundColor(.white)
//                                        .font(.title2)
//                                    
//                                    
//                                    Text("0 hrs")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                }
//                                .padding()
//                            }
//                        }
//                        VStack {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .frame(height: 150)
//                                    .foregroundColor(Color.red.opacity(0.8))
//                                
//                                VStack(alignment: .leading, spacing: 10) {
//                                    HStack {
//                                        Spacer()
//                                        Image(systemName: "light.min")
//                                            .resizable()
//                                            .frame(width: 40, height: 40)
//                                            .padding(.trailing, 10)
//                                            .foregroundColor(.white)
//                                    }
//                                    Text("Stress")
//                                        .bold()
//                                        .foregroundColor(.white)
//                                        .font(.title2)
//                                    
//                                    
//                                    Text("0 HRV")
//                                        .foregroundColor(.white)
//                                        .font(.title3)
//                                }
//                                .padding()
//                            }
//                        }
//                    }
//                    .padding(.bottom, 30)
//                    
//                }
//                .navigationBarHidden(true)
//                .padding()
//            }
//            .navigationBarHidden(true)
//        }
//        
//        func formattedDate() -> String {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "MMMM dd, yyyy"
//            return formatter.string(from: Date())
//        }
//    }
//}
//
//struct SecondUser_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondUser()
//    }
//}
