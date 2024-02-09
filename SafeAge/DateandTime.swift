//
//  DateandTime.swift
//  SafeAge
//
//  Created by user1 on 17/01/24.
//
import SwiftUI

struct DateandTime: View {
    @State private var isDateTimePickerVisible = false
    @State private var selectedDate = Date()
    @State private var bs_type = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                HStack{
                    Text("Lab")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Text("Booking")
                        .font(.title)
                        .fontWeight(.bold)
                }

                Menu {
                    Button("Cancel", role: .destructive) {
                        // Do something
                    }

                    Button {
                        bs_type = "BS4"
                    } label: {
                        Label("Sugar", systemImage:  "carbon.dioxide.cloud.fill")
                    }

                    Button {
                        bs_type = "BS5"
                    } label: {
                        Label("Blood", systemImage: "drop.fill")
                    }

                    Button {
                        bs_type = "BS6"
                    } label: {
                        Label("Full body ", systemImage: "carbon.monoxide.cloud")
                    }
                } label: {
                    RoundedRectangleButton(title: "Type of Test") {
                        print("Type of Test button tapped")
                    }
                }
                .frame(height: 60) // Adjust height as needed
                .padding(.vertical, 4)

                RoundedRectangleButton(title: "Select Date and Time", action: {
                    isDateTimePickerVisible.toggle()
                })
                .frame(height: 60)
                .padding(.vertical, 4)

                if isDateTimePickerVisible {
                    DateTimePicker(selectedDate: $selectedDate) {
                        updateDate()
                        closeDateTimePicker()
                    }
                    .frame(height: 150) // Adjust height as needed
                    .padding(.vertical, 4)

                    Button("Done") {
                        doneButtonTapped()
                        closeDateTimePicker()
                    }
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .frame(maxWidth: .infinity)
                                        .cornerRadius(5)
                    .padding(.vertical, 4)
                }

                // ... (Other RoundedRectangleButton instances)

                Spacer()

                NavigationLink(destination: Text("Apply")) {
                    Text("Apply")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex:"f6bd60"))
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(false)
        }
    }

    private func updateDate() {
        print("Selected date and time: \(selectedDate)")
    }

    private func doneButtonTapped() {
        // Perform any actions when the "Done" button is tapped
    }

    private func closeDateTimePicker() {
        isDateTimePickerVisible = false
    }
}

struct RoundedRectangleButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.1))
                .overlay(
                    Text(title)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .font(.caption)
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 4)
        }
    }
}

struct DateTimePicker: View {
    @Binding var selectedDate: Date
    var onDone: () -> Void

    var body: some View {
        VStack {
            DatePicker(
                "",
                selection: $selectedDate,
                in: Date()...,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .padding()

            HStack {
                Spacer()

                Button("Done") {
                    onDone()
                }
                .foregroundColor(.blue)
                .font(.caption)
                .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                .frame(maxWidth: .infinity)
                .cornerRadius(5)
            }
        }
        .background(Color.white)
        .cornerRadius(5)
        .padding(.vertical, 4)
    }
}

struct DateandTime_Previews: PreviewProvider {
    static var previews: some View {
        DateandTime()
    }
}
