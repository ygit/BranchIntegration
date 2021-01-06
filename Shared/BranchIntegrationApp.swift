//
//  BranchIntegrationApp.swift
//  Shared
//
//  Created by Yogesh Singh on 06/01/21.
//

import SwiftUI
import UIKit
import CleverTapSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        CleverTap.autoIntegrate()
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
