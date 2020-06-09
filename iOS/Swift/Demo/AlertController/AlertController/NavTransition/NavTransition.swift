//
//  NavTransition.swift
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

class NavTransition: NSObject, UINavigationControllerDelegate {
    
    var interactive = false
    lazy var interactionController = UIPercentDrivenInteractiveTransition()
    
    /// 将要展示 UIViewController的view 以及 navigationItem 属性之前调用
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }

    /// 展示了UIViewController的view 以及 navigationItem 属性之后调用
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    
    /// 返回动画控制器
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NavAnimatedTransition(operation)
    }

    /// 返回交互控制器
    /// 交互控制器还需要交互手段的配合，最常见的是使用手势，或是其他事件，来驱动整个转场进程。
    /// 系统已经打包好了现成的类UIPercentDrivenInteractiveTransition
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? interactionController : nil
    }
    
    
    
    /// 返回导航控制器支持的屏幕方向
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return .all
    }
    
    /// 返回导航控制器的首选显示方向
    func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
