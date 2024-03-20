import SwiftUI
import UserNotifications

struct ViewController: View {
    @StateObject private var healthDataManager = HealthDataManager()

    var body: some View {
        Text("Example Notification")
            .onAppear {
                checkForPermission()
                checkVitalsAndNotify()
            }
    }

    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                return
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        // The notifications will be generated based on vitals, not a specific time
                        // Remove the call to dispatchNotification here
                    }
                }
            default:
                return
            }
        }
    }

    func checkVitalsAndNotify() {
        if healthDataManager.heartRate < 60 || healthDataManager.heartRate > 90 ||
            healthDataManager.temperature < 36 || healthDataManager.temperature > 37 ||
            healthDataManager.bloodPressureSystolic > 140 || healthDataManager.bloodPressureSystolic < 100 ||
            healthDataManager.stressLevel > 80 {
            generateNotification()
        }
    }

    func generateNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Vital Alert!"
        content.body = "One or more vitals are out of the normal range. Check your health status."
        content.sound = .default

        // Schedule the notification to be delivered 5 seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}

struct NotificationExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}

