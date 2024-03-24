import SwiftUI

struct TabBar: View {
    // Constant for icon size
    private let iconSize: CGFloat = 50
    
    @StateObject var healthDataFirebaseManager: HealthDataFirebaseManager
    @EnvironmentObject var documentIDManager: DocumentIDManager // Inject DocumentIDManager
    
    init() {
        _healthDataFirebaseManager = StateObject(wrappedValue: HealthDataFirebaseManager(documentIDManager: DocumentIDManager()))
    }
    
    var body: some View {
        TabView {
            // Icon 1
            MainPage()
                .tabItem {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("Home")
                }
            
            // Icon 2
            CallingView2()
                .tabItem {
                    Image(systemName: "command")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("Action Centre")
                }
            
            // Icon3
            SharingView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up.circle")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("Share")
                    
                }
            
            List2View()
                .environmentObject(healthDataFirebaseManager)
                .tabItem {
                    Image(systemName: "figure.and.child.holdinghands")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("Family Share")
                    
                }
        }
    }
    
    struct TabBar_Previews: PreviewProvider {
        static var previews: some View {
            TabBar()
                .environmentObject(DocumentIDManager()) // Inject DocumentIDManager for preview
        }
    }
}
