import SwiftUI
import Firebase

@main
struct SafeAgeApp: App {
    @StateObject var healthdatafirebasemanager = HealthDataFirebaseManager()

    init() {
        FirebaseApp.configure()
        // Initialize healthdatafirebasemanager here if needed
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(healthdatafirebasemanager)
        }
    }
}
