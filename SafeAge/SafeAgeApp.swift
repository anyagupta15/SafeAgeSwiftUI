import SwiftUI
import Firebase

@main
struct SafeAgeApp: App {
    // Define properties for your managers
    @StateObject var healthDataManager = HealthDataManager()
    @StateObject var documentIDManager = DocumentIDManager()

    init() {
        FirebaseApp.configure() // Initialize Firebase
    }

    var body: some Scene {
        WindowGroup {
            // Initialize HealthDataFirebaseManager within the body
            let healthDataFirebaseManager = HealthDataFirebaseManager(documentIDManager: documentIDManager)
            
            // Provide the environment objects to the TabBar
            TabBar()
                .environmentObject(healthDataFirebaseManager)
                .environmentObject(healthDataManager)
                .environmentObject(documentIDManager) // Inject DocumentIDManager into the environment
        }
    }
}
