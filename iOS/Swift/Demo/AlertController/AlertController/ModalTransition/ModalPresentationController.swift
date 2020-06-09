//
//  ModalPresentationController.swift
//  AlertController
//
//  Created by czm on 2020/6/1.
//  Copyright © 2020 czm. All rights reserved.
//
// https://www.jianshu.com/p/a7335474651c


import UIKit

class ModalPresentationController: UIPresentationController {

    let maskView: UIView
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        maskView = UIView()
        maskView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        maskView.alpha = 0.0
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    // 设置所有呈现 View 的 frame
    override func containerViewWillLayoutSubviews() {
        
        maskView.frame = containerView!.bounds
        presentedView?.bounds = CGRect(x: 0, y: 0, width: 200, height: 250)
        presentedView?.center = containerView!.center
    }
    
    /// 将要呈现控制器时
    override func presentationTransitionWillBegin() {
        
        containerView?.addSubview(maskView)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.maskView.alpha = 1.0
        }, completion: nil)
    }
    
    /// 将要移除presentingView时
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.maskView.alpha = 0.0
        }, completion: { (_) in
            self.maskView.removeFromSuperview()
        })
    }

}


    
