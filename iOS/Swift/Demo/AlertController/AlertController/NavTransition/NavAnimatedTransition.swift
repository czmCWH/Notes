//
//  NaviAnimatedTransition.swift
//  AlertController
//
//  Created by czm on 2020/6/3.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit


class NavAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let operation: UINavigationController.Operation
    
    init(_ type: UINavigationController.Operation) {
        self.operation = type
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                return
        }
                
        let fromView = fromVC.view!
        let toView = toVC.view!
        
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        
//        let toViewFinalFrame = transitionContext.finalFrame(for: toVC)
        let containerFrame = containerView.frame
        
        if operation == .push {
            
            containerView.addSubview(toView)
            toView.frame.origin.x = -containerFrame.width
            
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseInOut, animations: {
                
                fromView.frame.origin.x = containerFrame.width
                toView.frame.origin.x = 0
                
            }) { (_) in
                let res = !transitionContext.transitionWasCancelled
                transitionContext.completeTransition(res)
            }
        }
        
        if operation == .pop {
            
            containerView.insertSubview(toView, belowSubview: fromView)
            toView.frame.origin.x = containerFrame.width
            
            UIView.animate(withDuration: duration, animations: {
                
                fromView.frame.origin.x = -containerFrame.width
                toView.frame.origin.x = 0
                
            }) { (_) in
                
                let res = !transitionContext.transitionWasCancelled
                transitionContext.completeTransition(res)
            }
        }
        
    }
    
//    @available(iOS 10.0, *)
//    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
//
//    }

    func animationEnded(_ transitionCompleted: Bool) {
        
    }
}

