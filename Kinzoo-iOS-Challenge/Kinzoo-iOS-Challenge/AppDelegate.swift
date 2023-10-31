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
    var coordinator:BaseCoordinator?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()
        navController.navigationBar.prefersLargeTitles = true
        
        
        coordinator = AppCoordinator(navigationController: navController,
                                     appConfig:AppConfiguration(baseUrl:"https://rickandmortyapi.com/api/"),
                                     sessionConfig: AppSessionPolicy(
                                     configType: .default,
                                     waitsForConnectivity: true,
                                     timeOutInterval: 30)
        )
        
        
        coordinator?.start(path: .list)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
}

