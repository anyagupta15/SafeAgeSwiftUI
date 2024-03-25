import SwiftUI

struct SettingsView: View {
    @State private var isPriyaExpanded = false
    @State private var isRohanExpanded = false
    @State private var isShareSheetPresented = false

    var body: some View {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()

                VStack {

                    List {
                        Section(header: Text("Account")) {
//                            NavigationLink(destination: NavigationView {
//                                HealthProfile()
//                            }) {
//                                Label("Profile", systemImage: "person.circle")
//                            }

//                            NavigationLink(destination: Text("Emergency Contacts")) {
//                                Label("Emergency Contacts", systemImage: "person.crop.circle.badge.plus")
//                            }
                            NavigationLink(destination: LogoutView()) { // Added navigation link to LogoutView
                                                            Label("Logout", systemImage: "arrow.uturn.backward.circle")
                                                        }
                        }

//                        Section(header: Text("Sharing with")) {
//
//                            DisclosureGroup(
//                                isExpanded: $isPriyaExpanded,
//                                content: {
//                                    NavigationLink(destination: Text("Stop Sharing with Priya")) {
//                                        Label("Stop Sharing with Priya", systemImage: "person")
//                                    }
//                                },
//                                label: {
//                                    Label("Priya", systemImage: "person")
//                                }
//                            )
//
//                            DisclosureGroup(
//                                isExpanded: $isRohanExpanded,
//                                content: {
//                                    NavigationLink(destination: Text("Stop sharing it with Rohan")) {
//                                        Label("Stop sharing with Rohan", systemImage: "person")
//                                    }
//                                },
//                                label: {
//                                    Label("Rohan", systemImage: "person")
//                                }
//                            )
//                        }
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

