//
//  AppDelegate.swift
//  Innixi
//
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        Utils.setLogedIn(login: false)
        Utils.setUser(name: "")
        Utils.setPageControlColor()
        
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) {(granted, error) in
                // Make sure permission to receive push notifications is granted
                print("Permission is granted: \(granted)")
        }
        
        UNUserNotificationCenter.current().delegate = self
        
        // When the app launch after user tap on notification (originally was not running / not in background)
        if(launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] != nil){
            // your code here
            displayTrackingOnNotificationClick()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        EmpaticaAPI.prepareForBackground()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        EmpaticaAPI.prepareForResume()
    }

    func applicationWillTerminate(_ application: UIApplication) {}
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Push notification received in foreground.")
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
      // tell the app that we have finished processing the user’s action / response
        
        displayTrackingOnNotificationClick()
        completionHandler()
    }
    
    func displayTrackingOnNotificationClick() {
        let storyboard = UIStoryboard(name: "Tracking", bundle: nil)

           // instantiate the view controller from storyboard
           if  let trackingVC = storyboard.instantiateViewController(withIdentifier: "TrackingViewController") as? TrackingViewController {

               // set the view controller as root
               self.window?.rootViewController = trackingVC
           }
    }

}

