import SwiftUI

struct EcoView: View {
    @State private var selectedTime = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bus")) {
                    NavigationLink(destination: Text("About")) {
                        Label("Time Travelled", systemImage: "bus.fill")
                    }
                    
                    NavigationLink(destination: Text("Preferences")) {
                        Label("Time Travelled", systemImage: "bus.doubledecker")
                    }
                    
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                }
                
                Section(header: Text("Car")) {
                    NavigationLink(destination: Text("Details")) {
                        Label("Details", systemImage: "person.circle")
                    }
                    
                    NavigationLink(destination: Text("Security")) {
                        Label("Details", systemImage: "lock")
                    }

                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                }
                
                Section(header: Text("Auto")) {
                    NavigationLink(destination: Text("Details")) {
                        Label("Time Travelled", systemImage: "person.circle")
                    }
                    
                    NavigationLink(destination: Text("Security")) {
                        Label("Time Travelled", systemImage: "lock")
                    }

                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                }
                
                Section(header: Text("Train")) {
                    NavigationLink(destination: Text("Details")) {
                        Label("Time Travelled", systemImage: "person.circle")
                    }
                    
                    NavigationLink(destination: Text("Security")) {
                        Label("Time Travelled", systemImage: "lock")
                    }

                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct EcoView_Previews: PreviewProvider {
    static var previews: some View {
        EcoView()
    }
}

