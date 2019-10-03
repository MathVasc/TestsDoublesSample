//
//  AppDelegate.swift
//  TestsDoublesSample
//
//  Created by Matheus de Vasconcelos on 20/09/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController(rootViewController: UIViewController())
        let formatterController = FormatterViewController(formatter: NumberFormatter())
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, formatterController]
        window.rootViewController = tabBarController
        window.backgroundColor = .white
        self.window = window
        window.makeKeyAndVisible()

        return true
    }

}

