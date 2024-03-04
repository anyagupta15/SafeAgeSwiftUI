import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Initialize UIWindow and set root view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootView = ContentView() // Assuming ContentView is your SwiftUI root view
        let mainViewController = UIHostingController(rootView: rootView)
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        window?.makeKeyAndVisible()

        return true
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
            }
            return true
        }
        return false
    }
}

