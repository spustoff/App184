//
//  App184App.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_C9ew4jocitHarntGqLdJJLtvSYfaqP")
        Amplitude.instance().initializeApiKey("d9dd4c04eea386c455d09d79c973a92c")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App184App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
