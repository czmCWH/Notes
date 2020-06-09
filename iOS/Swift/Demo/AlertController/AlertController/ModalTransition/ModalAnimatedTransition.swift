//
//  ModalAnimatedTransition.swift
//  AlertController
//
//  Created by czm on 2020/6/1.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class ModalAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    /// 返回动画过渡持续的时间，以秒为单位
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    /// 在此方法中实现自定义执行过渡动画，显示或关闭VC时，UIKit会调用该方法执行动画，执行动画最核心的地方
    /// - Parameter transitionContext: 转场环境，提供转场所需的数据
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 0. 容器视图，动画执行的地方
        let containerView = transitionContext.containerView
        
        // 1. 获取参与转场的视图控制器的根视图
        // fromView 表示即将消失的场景的view；toView 表示即将显示的场景的View
        //  fromView 和 toView 在逆向操作里的角色互换成对方
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        // 这种方式获取View，有时候获取不到
//        let fromView = transitionContext.view(forKey: .from),
//        let toView = transitionContext.view(forKey: .to)
        
        let fromView = fromVC.view!
        let toView = toVC.view!
        
        
        // 2.转场的时间
        let duration = transitionDuration(using: transitionContext)
        
        if toVC.isBeingPresented {
            
            containerView.addSubview(toView)
            toView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1);
            
            if #available(iOS 8.0, *) {
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                    
                    toView.transform = CGAffineTransform.identity
                    
                }) { (_) in
                    // 获取转场的结果
                    let res = !transitionContext.transitionWasCancelled
                    // 通知UIKit转场是否完成，如果完成会自动调用 animationEnded 方法
                    transitionContext.completeTransition(res)
                }
            } else {
                
                // UIPresentationController 是 iOS8.0 以后新增的API
                // 若系统版本低于 ios 8.0，或者 未提供 UIPresentationController，则我们添加额外的视图，需要在此处提供；并且在此处改变 presentedVC.view 的frame
                toView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
                toView.center = containerView.center
                
                let maskView = UIView(frame: containerView.bounds)
                maskView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
                maskView.alpha = 0.0
                containerView.insertSubview(maskView, belowSubview: toView)
                
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                    maskView.alpha = 0.0
                    toView.transform = CGAffineTransform.identity
                    
                }) { (_) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            }
            
            
        }
        
        //Dismissal 转场中不要将 toView 添加到 containerView
        if fromVC.isBeingDismissed {
            
            UIView.animate(withDuration: duration, animations: {
                fromView.alpha = 0.0
            }) { (_) in
                // 获取转场的结果
                let res = !transitionContext.transitionWasCancelled
                // 通知UIKit转场是否完成，如果完成会自动调用 animationEnded 方法
                transitionContext.completeTransition(res)
            }
        }
        
    }
    
    /// 返回过渡时期使用的可中断动画对象
    /// - Parameter transitionContext: 转场环境
    /// 此方法可选
//    @available(iOS 10.0, *)
//    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
//
//    }
    
    /// 转场动画结束时被调用
    /// - Parameter transitionCompleted: true: 转场完成，显示新VC；false：过渡被取消，原始VC仍然可见
    func animationEnded(_ transitionCompleted: Bool) {

    }
}
