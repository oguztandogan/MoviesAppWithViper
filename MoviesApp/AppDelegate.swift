//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        let initialNavigationController = UINavigationController()
        initialNavigationController.setRootWireframe(MainScreenWireframe())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.rootViewController = initialNavigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

