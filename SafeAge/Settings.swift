import SwiftUI

struct SettingsView: View {
    @State private var isPriyaExpanded = false
    @State private var isRohanExpanded = false
    @State private var isShareSheetPresented = false
    
    var body: some View {
        //  NavigationView {
        ZStack{
            Color.gray.opacity(0.1).ignoresSafeArea()
        
        VStack {
            
            Text("User Profile")
                .font(.title)
                .bold()
            
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: HealthProfile()) {
                        Label("Profile", systemImage: "person.circle")
                    }
                    
                    NavigationLink(destination: Text("Emergency C")) {
                        Label("Emergency Contacts", systemImage: "person.crop.circle.badge.plus")
                    }
                }
                
                Section(header: Text("Sharing with")) {
                    
                    DisclosureGroup(
                        isExpanded: $isPriyaExpanded,
                        content: {
                            NavigationLink(destination: Text("Shared with Priya")) {
                                Label("Shared with Priya", systemImage: "person")
                            }
                        },
                        label: {
                            Label("Priya", systemImage: "person")
                        }
                    )
                    
                    DisclosureGroup(
                        isExpanded: $isRohanExpanded,
                        content: {
                            NavigationLink(destination: Text("Shared with Rohan")) {
                                Label("Shared with Rohan", systemImage: "person")
                            }
                        },
                        label: {
                            Label("Rohan", systemImage: "person")
                        }
                    )
                }
                
                Section(header: Text("Support")) {
                    NavigationLink(destination: Text("Help & Feedback")) {
                        Label("Help & Feedback", systemImage: "questionmark.circle")
                    }
                    
                    NavigationLink(destination: Text("Contact Us")) {
                        Label("Contact Us", systemImage: "envelope.circle")
                    }
                }
                
                Section(header: Text("Share with")) {
                    Button(action: {
                        isShareSheetPresented.toggle()
                    }) {
                        Label("Share with Priya and Rohan", systemImage: "arrowshape.turn.up.right.circle")
                    }
                    .sheet(isPresented: $isShareSheetPresented) {
                        ShareSheet(activityItems: [URL(string: "https://your-website-or-app-link.com")!])
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}
}
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
    
    struct ShareSheet: UIViewControllerRepresentable {
        let activityItems: [Any]
        
        func makeUIViewController(context: Context) -> UIActivityViewController {
            let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
            // Do nothing
        }
    }
    
