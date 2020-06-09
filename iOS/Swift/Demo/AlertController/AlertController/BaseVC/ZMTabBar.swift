//
//  ZMTabBar.swift
//  AlertController
//
//  Created by czm on 2020/6/3.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

// /2016/06/18/iOS+会跳舞的TabbarController/

class ZMTabBar: UITabBar {

//    override func action(for layer: CALayer, forKey event: String) -> CAAction? {
//        if (event == "position") {
//            
//            print(layer.position.x)
//            
//            if layer.position.x < 0 {
//                //show tabbar
//                let pushFromTop = CATransition()
//                pushFromTop.duration = 0.5
//                pushFromTop.timingFunction = CAMediaTimingFunction(name: .easeIn)
//                pushFromTop.type = .push
//                pushFromTop.subtype = .fromLeft
//                return pushFromTop
//            } else if layer.position.x > 0 && (layer.position.y > layer.bounds.size.height) && (layer.position.y < UIScreen.main.bounds.size.height) {
//                //hide tabbar
//                let pushFromBottom = CATransition()
//                pushFromBottom.duration = 0.5
//                pushFromBottom.timingFunction = CAMediaTimingFunction(name: .easeIn)
//                pushFromBottom.type = .push
//                pushFromBottom.subtype = .fromRight
//                return pushFromBottom
//            }
//        }
////        return NSNull() as? CAAction
//        return super.action(for: layer, forKey: event)
//    }
//
//    func run(forKey event: String, object anObject: Any, arguments dict: [AnyHashable : Any]?) {
//    }

}
