//
//  AppDelegate.swift
//  layout
//
//  Created by czm on 2020/6/28.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        if #available(iOS 9.0, *) {
            window?.rootViewController = UIViewController()
        }
        window?.makeKeyAndVisible()
        
        
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.rootViewController = vc
        
        return true
    }


}

