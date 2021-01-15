//
//  BranchIntegrationApp.swift
//  Shared
//
//  Created by Yogesh Singh on 06/01/21.
//

import SwiftUI
import UIKit
import CleverTapSDK
import Branch
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        CleverTap.autoIntegrate()
        
        let profile = [
            "Name": "Jack Montana",
            "Email": "jack.montana@gmail.com",
            "Plan type": "Silver",
            "Favorite Food": "Pizza"
        ]
        
        CleverTap.sharedInstance()?.profilePush(profile)
        
        let branch: Branch = Branch.getInstance()
        branch.initSession(launchOptions: launchOptions)
        
        //        Branch.getInstance().validateSDKIntegration()
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self;
        center.requestAuthorization(options: [.sound,.alert,.badge]) { (granted, error) in
            if granted {
                print("Notification Enable Successfully")
            } else {
                print("Some Error Occure")
            }
        }
        
        application.registerForRemoteNotifications()
        
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        CleverTap.sharedInstance()?.handleOpen(url, sourceApplication: nil)
        
        Branch.getInstance().application(app, open: url, options: options)
        
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        let handledByBranch = Branch.getInstance().continue(userActivity)
        
        return handledByBranch
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
     
        print(userInfo)
        Branch.getInstance().handlePushNotification(userInfo)
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: userInfo)
        completionHandler(.newData)
    }
    
    
    // MARK: - Push Notifications
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo
        
        print(userInfo)
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: userInfo)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        print(userInfo)
        CleverTap.sharedInstance()?.recordNotificationClickedEvent(withData: userInfo)
    }
}

@main
struct BranchIntegrationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
