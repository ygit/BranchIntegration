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
        
        Branch.getInstance().validateSDKIntegration()
        
        return true
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
