import UIKit
import SwiftUI
import UserNotifications

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        requestNotificationAuthorization()
        
        // Initialize UIWindow and set root view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootView = ContentView() // Assuming ContentView is your SwiftUI root view
        let mainViewController = UIHostingController(rootView: rootView)
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        window?.makeKeyAndVisible()

        return true
    }
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
        }
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        // Handle the custom URL scheme
        if url.scheme == "myhealthapp" {
            // Extract any parameters if needed
            // For example, you can parse the URL to determine which content to display
            
            // Navigate to the main page
            if let rootViewController = window?.rootViewController as? UINavigationController {
                // Assuming your main page is the root view controller
                // You might need to adjust this based on your app's navigation structure
                rootViewController.popToRootViewController(animated: false)
                
                // Show your main page here
                let mainPage = UIHostingController(rootView: MainPage()) // Wrap MainPage in UIHostingController
                rootViewController.pushViewController(mainPage, animated: true)
                
                // Schedule local notifications based on health data
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    if let mainPage = mainPage as? MainPage {
                        let alertMessage = mainPage.alertMessage()
                        if !alertMessage.isEmpty {
                            appDelegate.scheduleLocalNotification(with: alertMessage)
                        }
                    }
                }
            }
            return true
        }
        return false
    }
    
    func scheduleLocalNotification(with body: String) {
        let content = UNMutableNotificationContent()
        content.title = "Alert!"
        content.body = body
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false) // Trigger notification after 1 second

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling local notification: \(error.localizedDescription)")
            }
        }
    }
}

