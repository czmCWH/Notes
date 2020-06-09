//
//  TabBarTransition.swift
//  AlertController
//
//  Created by czm on 2020/6/1.
//  Copyright © 2020 czm. All rights reserved.
//

/*
   UIViewControllerAnimatedTransitioning
   UIViewControllerInteractiveTransitioning

*/

import UIKit

class TabBarTransition: NSObject, UITabBarControllerDelegate {
    
    var interactive = false
    let interactionController = UIPercentDrivenInteractiveTransition()
    
    /// 返回标签栏控制器支持的界面方向。
    func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        return .all
    }
    
    /// 返回呈现标签栏控制器的首
    func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
        return .portrait
    }
    
    /// 返回交互控制器
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? interactionController : nil
    }

    /// 返回动画控制器
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if interactive {
            let fromIndex = tabBarController.viewControllers?.firstIndex(of: fromVC)
            let toIndex = tabBarController.viewControllers?.firstIndex(of: toVC)
            guard let fromIdx = fromIndex, let toIdx = toIndex else { return nil }
            
            let direction: TabBarOperationDirection = fromIdx > toIdx ? .left : .right
            
            return TabBarAnimatedTransition(direction)
            
        } else {
            return nil
        }
    }
}
