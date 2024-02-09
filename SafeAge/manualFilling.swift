//
//  ContentView.swift
//  EasyMenus
//
//  Created by Federico on 11/11/2021.
//

import SwiftUI

struct manualFilling: View {
    @State private var car = ""
    @State private var fuel = ""
    @State private var fuelConsumption = ""
    @State private var carMileage = Date()
    @State private var selectedTimeSlot: String?
    @State private var vehicleAge = ""
    @State private var showingNextScreen = false
    @State private var bs_type = ""
    @State private var showingConfirmationAlert = true
    
    let timeSlots = ["10:00 AM", "12:00 PM", "02:00 PM", "04:00 PM", "06:00 PM"]

    var body: some View {
        VStack {
            
            HStack(spacing: 0){
                Text("Lab").font(.title)
                    .bold()
                Text(" ")
                Text("Booking")
                    .font(.title)
                    .bold()
                
            }
            .padding(.bottom, 20)
            Image("lab book")
                .resizable()
                .scaledToFit()
            //start of cartype menu
            HStack{
                Text("Test Type :")
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
                    car = "Blood"
                }label: {
                    Label("Blood", systemImage:  "drop.circle.fill")
                }
                
                Button {
                    // Do something
                    car = "Sugar"
                } label: {
                    Label("Sugar", systemImage: "aqi.medium")
                }
                
                Button {
                    // Do something
                    car = "Full body"
                } label: {
                    Label("Full body", systemImage: "staroflife.fill")
                }
                Button {
                    // Do something
                    car = "Other"
                } label: {
                    Label("Other", systemImage: "truck.pickup.side.fill")
                }
            } label: {
                TextField("e.g. Blood Test" , text: $car){
                    
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
            
            
            
            
    
                
            HStack {
                            Text("Date :")
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
                            .padding(.bottom)
                            
                            Text("")
                                .padding(.trailing, 10)
                                .foregroundColor(.gray)
                        }
                        .padding()
            HStack {
                            Text("Time Slots:")
                                .foregroundStyle(Color.black)
                                .padding(.leading, 50)
                                
                            Spacer()
                        }
                        .padding(.bottom, -2)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(timeSlots, id: \.self) { slot in
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(selectedTimeSlot == slot ? .blue : .gray.opacity(0.5))
                                        .overlay(
                                            Text(slot)
                                                .foregroundColor(.white)
                                                .fontWeight(selectedTimeSlot == slot ? .bold : .regular)
                                        )
                                        .frame(width: 100, height: 40)
                                        .onTapGesture {
                                            selectedTimeSlot = slot
                                        }
                                }
                            }
                            .padding(10)
                        }

            
                        
                        // Other input fields...
                        
                        Button("Confirm") {
                            showingNextScreen.toggle()
                        }
                        .foregroundColor(.white)
                        .frame(width: 201, height: 44)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                }
                
                struct manualFilling_Previews: PreviewProvider {
                    static var previews: some View {
                        manualFilling()
                    }
                }
            }

