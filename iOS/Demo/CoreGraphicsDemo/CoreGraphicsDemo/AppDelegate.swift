//
//  AppDelegate.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/19.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        if #available(iOS 9, *) {
            window?.rootViewController = UIViewController()
        }
        window?.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        
        return true
    }


}

