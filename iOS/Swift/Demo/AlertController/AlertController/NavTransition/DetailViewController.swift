//
//  DetailViewController.swift
//  AlertController
//
//  Created by czm on 2020/6/3.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    var navigationDelegate: NavTransition = NavTransition()
    let panGesture = UIPanGestureRecognizer()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.hideTabbar(hidden: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "详情"
        view.backgroundColor = .green
        
        panGesture.addTarget(self, action: #selector(panGestureRecognizerAction(_:)))
        navigationController?.view.addGestureRecognizer(panGesture)
        //添加了新的手势，禁用以前的手势
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    @objc func panGestureRecognizerAction(_ gesture: UIPanGestureRecognizer) {
        
        let translationX =  gesture.translation(in: view).x
        if translationX > 0 { return }
        let translationAbs = CGFloat(abs(translationX))
        let process = translationAbs / view.frame.width
        let velocityX = gesture.velocity(in: view).x
        
        switch gesture.state {
        case .began:
            
            if velocityX < 0 {
                navigationDelegate.interactive = true
                navigationController?.popViewController(animated: true)
            }
        case .changed:
            navigationDelegate.interactionController.update(process)
            
        case .ended, .cancelled:
            if process > 0.3 {
                navigationDelegate.interactionController.finish()
            } else {
                navigationDelegate.interactionController.cancel()
            }
            navigationDelegate.interactive = false
        default:
            break
        }
    }
}
