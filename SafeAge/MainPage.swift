import SwiftUI

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
    
    // Set the initial progress value
    
    
    var body: some View {
            VStack {
                HStack{
                    Text("January 18th ")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 1)
                    Spacer()
                    Button(action: {
                        // Show the action sheet when the button is tapped\
                        showAlert = true
                    }) {
                        Image(systemName: "bell")
                            .font(.title)
                            .foregroundColor(.blue)
                        
                    }
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
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 160)
                            .foregroundColor(Color.frontrect)
                        
                        VStack{
                            
                            
                            HStack{
                                NavigationLink(destination: HeartRateHistoryView(), isActive: $showingHeartRateHistory) {
                                                                    EmptyView()
                                                                }
                                                                .hidden()
                                                                
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 20)
                                    .onTapGesture {
                                        showingHeartRateHistory.toggle()
                                                                            }
                                Spacer()
                                Text("Heart Rate")
                                    .padding(.trailing, 10)
                                 
                                
                                
                            }
                            ProgressView(value: progressValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .padding()
                            
                            Text(" \(Int(progressValue * 100))bpm")
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 160)
                            .foregroundColor(Color.frontrect)
                        
                        VStack{
                            
                            
                            HStack{
                                Image(systemName: "figure.step.training")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 20)
                                Spacer()
                                Text("Steps")
                                    .padding(.trailing, 10)
                                
                                
                            }
                            ProgressView(value: progressValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .padding()
                            Text("\(Int(progressValue * 100)) Steps")
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }
                    
                    
                    
                }
                .padding(.bottom, 30)
                
                HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 160)
                            .foregroundColor(Color.frontrect)
                        
                        VStack{
                            
                            
                            HStack{
                                Image(systemName: "medical.thermometer")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 20)
                                Spacer()
                                Text("Temp")
                                    .padding(.trailing, 10)
                                
                            }
                            ProgressView(value: progressValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .padding()
                            
                            Text("\(Int(progressValue * 100)) C")
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 160)
                            .foregroundColor(Color.frontrect)
                        
                        VStack{
                            
                            
                            HStack{
                                Image(systemName: "ivfluid.bag")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 20)
                                Spacer()
                                Text("Blood Presure")
                                    .padding(.trailing, 10)
                                
                            }
                            ProgressView(value: progressValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .padding()
                            
                            Text(" \(Int(progressValue * 100)) mm/Hg")
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }
                    
                    
                    
                }
                .padding(.bottom, 30)
                
                HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 160)
                            .foregroundColor(Color.frontrect)
                        
                        VStack{
                            
                            
                            HStack{
                                Image(systemName: "bed.double.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 20)
                                Spacer()
                                Text("Sleep")
                                    .padding(.trailing, 10)
                                
                            }
                            ProgressView(value: progressValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .padding()
                            
                            Text("\(Int(progressValue * 100)) hrs")
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 160)
                            .foregroundColor(Color.frontrect)
                        
                        VStack{
                            
                            
                            HStack{
                                Image(systemName: "light.min")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading, 20)
                                Spacer()
                                Text("Stress")
                                    .padding(.trailing, 10)
                                
                            }
                            ProgressView(value: progressValue)
                                .progressViewStyle(LinearProgressViewStyle())
                                .padding()
                            
                            Text("\(Int(progressValue * 100)) HRV")
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }
                    
                    
                }
                
                
                .onAppear {
                                isShowingDialog = true
                            }
                            // Present the dialog when isShowingDialog is true
                .alert(isPresented: $isShowingDialog) {
                    Alert(
                        title: Text("Alert!"),
                        message: Text("Your Blood Pressure dropped to 80mm/Hg!"),
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
                            
                            // Add your action for calling ambulance
                          
                            print("Calling ambulance")
                        },
                        .default(Text("Call Saved Contact")) {
                            showingNextScreen.toggle()
                            // Add your action for calling saved contact
                            print("Calling saved contact")
                        },
                        .default(Text("Book Lab Appointment")) {
                            showingmanualFilling.toggle()
                            // Add your action for booking lab appointment
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
    }

    
    struct MainPage_Previews: PreviewProvider {
        static var previews: some View {
            MainPage()
        }
    }

