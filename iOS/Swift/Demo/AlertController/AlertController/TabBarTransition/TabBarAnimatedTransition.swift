//
//  TabBarAnimatedTransition.swift
//  AlertController
//
//  Created by czm on 2020/6/8.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

enum TabBarOperationDirection {
    case left, right
}

class TabBarAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var operationDirection: TabBarOperationDirection
    
    init(_ direction: TabBarOperationDirection) {
        operationDirection = direction
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            
        let containerView = transitionContext.containerView
        guard let fromVc = transitionContext.viewController(forKey: .from), let toVc = transitionContext.viewController(forKey: .to) else { return }
        
        let fromView = fromVc.view!
        let toView = toVc.view!
        let duration = transitionDuration(using: transitionContext)
        containerView.addSubview(toView)
        
        var translation = containerView.frame.size.width
        translation = operationDirection == .left ? translation : -translation
        toView.transform = CGAffineTransform(translationX: -translation, y: 0)
        
        UIView.animate(withDuration: duration, animations: {
            fromView.transform = CGAffineTransform(translationX: translation, y: 0)
            toView.transform = .identity
        }) { (_) in
            fromView.transform = .identity
            toView.transform = .identity
            let res = !transitionContext.transitionWasCancelled
            transitionContext.completeTransition(res)
        }
    }

}
