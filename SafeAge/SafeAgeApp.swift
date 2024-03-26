import SwiftUI
import Firebase

@main
struct SafeAgeApp: App {
    // Define properties for your managers
    @StateObject var healthDataManager = HealthDataManager()
    @StateObject var documentIDManager = DocumentIDManager()
    
    // Environment variable to check user's logged-in state
   // @StateObject var authViewModel = AuthViewModel()

    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
        }
    }

    init() {
        FirebaseApp.configure() // Initialize Firebase
        requestNotificationAuthorization() // Request notification authorization
    }

    var body: some Scene {
        WindowGroup {
            // Initialize HealthDataFirebaseManager within the body
            let healthDataFirebaseManager = HealthDataFirebaseManager(documentIDManager: documentIDManager)
            // Check the logged-in state and display appropriate view
                // If user is logged in, show the main content
                SplashView()
                    .environmentObject(healthDataFirebaseManager)
                    .environmentObject(healthDataManager)
                    .environmentObject(documentIDManager) // Inject DocumentIDManager into the environment
            
        }
    }
}
