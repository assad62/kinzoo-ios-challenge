//
//  AppDelegate.swift
//  Kinzoo-iOS-Challenge
//
//  Created by Development on 28/10/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var coordinator:Coordinator?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()
        coordinator = AppCoordinator(navigationController: navController)
        coordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
            
        
        
        
        
//         let navController = UINavigationController()
//         appCoordinator = AppCoordinator(navigationController: navController)
//         window = UIWindow(frame: UIScreen.main.bounds)
//         window?.makeKeyAndVisible()
//         let root = UINavigationController(rootViewController: navController)
//         window?.rootViewController = root
//        
//         appCoordinator?.start()
       
         return true
    }

    


}

