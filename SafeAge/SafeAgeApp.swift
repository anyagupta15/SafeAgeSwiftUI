import SwiftUI
import Firebase

@main
struct SafeAgeApp: App {
    @StateObject var healthdatafirebasemanager = HealthDataFirebaseManager()
    @StateObject var healthDataManager = HealthDataManager()

    init() {
        FirebaseApp.configure()
        // Initialize any other dependencies here if needed
    }

    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(healthdatafirebasemanager)
                .environmentObject(healthDataManager) // Inject HealthDataManager into the environment
        }
    }
}

