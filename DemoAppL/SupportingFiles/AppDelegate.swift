//
//  AppDelegate.swift
//  DemoAppL
//
//  Created by Karol Zmysłowski on 28/05/2019.
//  Copyright © 2019 Karol. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureViews()
        
        return true
    }
}

// MARK: - Confiurators
extension AppDelegate {

    private func configureViews() {
        let navController = CustomNavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        window?.makeKeyAndVisible()
        
    }
}
