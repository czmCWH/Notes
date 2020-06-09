//
//  ModalInteractiveTransition.swift
//  AlertController
//
//  Created by czm on 2020/6/1.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class ModalInteractiveTransition: NSObject, UIViewControllerInteractiveTransitioning {
    
    
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        
    }

    
    var completionSpeed: CGFloat { return 0.25 }

    
    var completionCurve: UIView.AnimationCurve { .easeInOut }

    
    @available(iOS 10.0, *)
    var wantsInteractiveStart: Bool { return true }
}
