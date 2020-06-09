//
//  VcTransition.swift
//  AlertController
//
//  Created by czm on 2020/6/1.
//  Copyright © 2020 czm. All rights reserved.
//

// https://github.com/seedante/iOS-Note/wiki/ViewController-Transition#Chapter0

import UIKit

class ModalTransition: NSObject, UIViewControllerTransitioningDelegate {
    
    // 为专场代理提供 动画控制器
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModalAnimatedTransition()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModalAnimatedTransition()
    }

    
    
    // 为转场代理提供 交互控制器
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    
    /// 返回一个呈现控制器，用于在呈现VC时，管理视图层次结构
    /// 如果返回nil，系统则默认返回一个呈现控制器，并且不会向视图层次中添加任何视图；我们可以通过它来添加额外的视图
    /// - Parameters:
    ///   - presented: 显示的控制器
    ///   - presenting: 呈现视图控制器的视图控制器
    ///   - source: 调用了present(_:animated:completion:)的vc
    @available(iOS 8.0, *)
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}
