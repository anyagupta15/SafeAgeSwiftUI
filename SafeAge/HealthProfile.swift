//
//  HealthProfile.swift
//  SafeAge
//
//  Created by user1 on 17/01/24.
//

import SwiftUI

struct HealthProfile: View {
    @State private var car = ""
    @State private var fuel = ""
    @State private var fuelConsumption = ""
    @State private var carMileage = Date()
    @State private var vehicleAge = ""
    @State private var showingNextScreen = false
    @State private var bs_type = ""
    @State private var name = ""
    var body: some View {
        VStack {
            Image(systemName: "heart.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
                .padding(.top, 20)
            //.padding(.bottom, 20)
            //start of cartype menu
            HStack{
                Text("First Name :")
                    .foregroundStyle(Color.black)
                    .padding(.leading, 50)
                    
                Spacer()
            }.padding(.bottom, -20)
            
            ZStack(alignment: .trailing) {
                
                TextField("Amritha", text: $name){
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.leading,20)
                .keyboardType(.numberPad)
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                //.padding(.bottom)
                
                
            }
            .padding()
            HStack{
                Text("Last Name :")
                    .foregroundStyle(Color.black)
                    .padding(.leading, 50)
                
                Spacer()
            }.padding(.bottom, -20)
            
            ZStack(alignment: .trailing) {
                
                TextField("Roy" , text: $fuelConsumption){
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.leading,20)
                .keyboardType(.numberPad)
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                //.padding(.bottom)
                
            }
            .padding()
            
            
            HStack {
                                        Text("Date of Birth :")
                                            .foregroundStyle(Color.black)
                                            .padding(.leading, 50)
                                            
                                        Spacer()
                                    }.padding(.bottom, -20)
                                    
                                    ZStack(alignment: .trailing) {
                                        DatePicker(
                                            "",
                                            selection: $carMileage,
                                            displayedComponents: [.date]
                                        )
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading, 20)
                                        .frame(width: 300, height: 50)
                                        .foregroundColor(Color.black)
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .padding(.bottom,5)
                                        
                                        Text("")
                                            .padding(.trailing, 10)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
            //end of car type menu
            
            
            
            
            //start of cartype menu
            HStack{
                Text("Sex :")
                    .foregroundStyle(Color.black)
                    .padding(.leading, 50)
                    
                Spacer()
            }.padding(.bottom, -2)
            Menu {
                Button("Cancel", role: .destructive) {
                    // Do something
                }
                
                
                Button {
                    // do something
                    fuel = "Male"
                }label: {
                    Label("Male", systemImage:  "crown")
                }
                
                Button {
                    // Do something
                    fuel = "Female"
                } label: {
                    Label("Female", systemImage: "crown.fill")
                }
                Button {
                    // Do something
                    fuel = "Other"
                } label: {
                    Label("Other", systemImage: "person.circle")
                }
                
            } label: {
                TextField("e.g Male" , text: $fuel){
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.leading,20)
                .keyboardType(.numberPad)
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                
            }.padding(.bottom, 20)
            //end of car type menu
            
            //car mileage
            
            
            //carbon emission type
            //start of cartype menu
            HStack{
                Text("Blood Group Type :")
                    .foregroundStyle(Color.black)
                    .padding(.leading, 50)
                    
                Spacer()
            }.padding(.bottom, -2)
            Menu {
                Button("Cancel", role: .destructive) {
                    // Do something
                }
                
                Button {
                    // do something
                    bs_type = "A+"
                }label: {
                    Label("A+", systemImage:  "drop.circle.fill")
                }
                
                Button {
                    // Do something
                    bs_type = "A-"
                } label: {
                    Label("A-", systemImage: "drop.circle.fill")
                }
                
                Button {
                    // Do something
                    bs_type = "B+"
                } label: {
                    Label("B+", systemImage: "drop.circle.fill")
                }
                Button {
                    // Do something
                    bs_type = "B-"
                } label: {
                    Label("B-", systemImage: "drop.circle.fill")
                }
                Button {
                    // Do something
                    bs_type = "AB+"
                } label: {
                    Label("AB+", systemImage: "drop.circle.fill")
                }
                Button {
                    // Do something
                    bs_type = "AB-"
                } label: {
                    Label("AB-", systemImage: "drop.circle.fill")
                }
                Button {
                    // Do something
                    bs_type = "O+"
                } label: {
                    Label("O+", systemImage: "drop.circle.fill")
                }
                Button {
                    // Do something
                    bs_type = "O-"
                } label: {
                    Label("O-", systemImage: "drop.circle.fill")
                }
            } label: {
                TextField("e.g. A+" , text: $bs_type){
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.leading,20)
                .keyboardType(.numberPad)
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                
            }.padding(.bottom, 20)
            
            
            
            //fuel consumption
            
            
            //vehicle age
            
                
        
            Button("Save") {
                showingNextScreen.toggle()
            }
            .foregroundColor(.white)
            .frame(width: 201, height: 44)
            .background(Color.blue)
            .cornerRadius(10)
           // .padding(.top, 30)
            
            //NavigationLink(destination: frequentlyUsedVehicles(), isActive: $showingNextScreen) {
               // EmptyView()
            //}
            
            //.navigationBarTitle("Manual Entry Details")
        }
    }
    
    struct HealthProfile_Previews: PreviewProvider {
        static var previews: some View {
            HealthProfile()
        }
    }
}
