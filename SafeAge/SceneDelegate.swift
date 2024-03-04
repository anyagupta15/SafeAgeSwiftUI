import SwiftUI
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let contentView = ContentView() // Replace with your initial view

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()

        UNUserNotificationCenter.current().delegate = self
    }

    // ... (other SceneDelegate methods)

}

extension SceneDelegate: UNUserNotificationCenterDelegate {
    // Handle tap on the notification when the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }

    // Handle tap on the notification when the app is in the background or terminated
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle the notification tap, for example, navigate to the desired view
        if response.notification.request.identifier == "my-notifications" {
            let contentView = ContentView() // Replace with your initial view
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                let mainPage = MainPage()
                let mainPageView = UIHostingController(rootView: mainPage)
                sceneDelegate.window?.rootViewController = mainPageView
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
        
        completionHandler()
    }
}

