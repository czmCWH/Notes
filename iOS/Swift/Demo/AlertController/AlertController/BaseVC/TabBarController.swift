//
//  TabBarController.swift
//  AlertController
//
//  Created by czm on 2020/6/1.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let tabBarTransition = TabBarTransition()
    private let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private var subViewControllers: Int {
        return viewControllers?.count ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(ZMTabBar(), forKey: "tabBar")
        
        self.tabBar.barTintColor = UIColor.white
        
        delegate = tabBarTransition
        panGesture.addTarget(self, action: #selector(TabBarController.handlepan(panGesture:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlepan(panGesture: UIPanGestureRecognizer) {
        let translationX = panGesture.translation(in: view).x
        let translationAbs = abs(translationX)
        let progress = translationAbs / view.frame.width
        
        switch panGesture.state {
        case .began:
            tabBarTransition.interactive = true
            let velocityX = panGesture.velocity(in: view).x
            if velocityX < 0 {
                if selectedIndex < subViewControllers - 1 {
                    selectedIndex += 1
                }
            } else {
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
            }
        case .changed:
            tabBarTransition.interactionController.update(progress)
        case .ended, .cancelled:
            if progress > 0.3 {
                tabBarTransition.interactionController.completionSpeed = 0.99
                tabBarTransition.interactionController.finish()
            } else {
                tabBarTransition.interactionController.completionSpeed = 0.99
                tabBarTransition.interactionController.cancel()
            }
            tabBarTransition.interactive = false
        default:
            break
        }
        
    }
}

extension UITabBarController {
    
    func hideTabbar(hidden: Bool) {
        
        let duration = hidden ? 0.5 : 0.0
        UIView.animate(withDuration: duration) {
            if hidden {
                self.tabBar.frame.origin.x = UIScreen.main.bounds.size.width
            } else {
                self.tabBar.frame.origin.x = 0
            }
        }
    }
}
