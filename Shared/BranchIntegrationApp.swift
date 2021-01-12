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

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        CleverTap.autoIntegrate()
        
        let profile = [
            "Name": "Jack Montana",
            "Email": "jack.montana@gmail.com",
            "Plan type": "Silver",
            "Favorite Food": "Pizza"
        ]

        CleverTap.sharedInstance()?.profilePush(profile)
        
//        Branch.getInstance().validateSDKIntegration()
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        CleverTap.sharedInstance()?.handleOpen(url, sourceApplication: nil)
        
        Branch.getInstance().application(app, open: url, options: options)
        
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        let handledByBranch = Branch.getInstance().continue(userActivity)
        
        return handledByBranch
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification launchOptions: [AnyHashable: Any]) -> Void {
        Branch.getInstance().handlePushNotification(launchOptions)
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
