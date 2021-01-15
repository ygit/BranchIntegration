//
//  AppInboxView.swift
//  BranchIntegration
//
//  Created by Yogesh Singh on 15/01/21.
//

import SwiftUI
import CleverTapSDK.CleverTap_Inbox

struct AppInboxView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let style = CleverTapInboxStyleConfig()
        let inbox: UIViewController = (CleverTap.sharedInstance()?.newInboxViewController(with: style, andDelegate: nil))!
        return inbox
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print(#function)
    }
}
