import SwiftUI

struct CallSaved: View {
    @State private var name1 = ""
    @State private var phoneNumber1 = ""
    @State private var name2 = ""
    @State private var phoneNumber2 = ""
    @State private var name3 = ""
    @State private var phoneNumber3 = ""
    
    var body: some View {
        VStack {
            Text("Emergency Contact 1")
                .font(.headline)
                .padding(.top)
            
            TextField("Name", text: $name1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Phone Number", text: $phoneNumber1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.phonePad)
            
            Text("Emergency Contact 2")
                .font(.headline)
                .padding(.top)
            
            TextField("Name", text: $name2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Phone Number", text: $phoneNumber2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.phonePad)
            
            Text("Emergency Contact 3")
                .font(.headline)
                .padding(.top)
            
            TextField("Name", text: $name3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Phone Number", text: $phoneNumber3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.phonePad)
            
            Button(action: {
                // Save functionality can be implemented here
            }) {
                Text("Save")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Call Saved")
    }
}

struct CallSaved_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CallSaved()
        }
    }
}
