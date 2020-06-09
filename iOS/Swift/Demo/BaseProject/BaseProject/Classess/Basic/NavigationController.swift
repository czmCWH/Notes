//
//  NavigationController.swift
//  BaseProject
//
//  Created by czm on 2020/4/23.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.zm.initHex(0xffffff)
        navigationBar.shadowImage = UIColor.clear.zm.toImage()
        navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black]
        
    }
    
}

extension UINavigationController {
    func push(_ controller: UIViewController, _ animated: Bool) {
        controller.hidesBottomBarWhenPushed = children.count > 0
        if let vc = self.topViewController {
            setBackButton(vc)
        }
        self.pushViewController(controller, animated: animated)
    }
    
    func setBackButton(_ controller: UIViewController) {
        
       // 设置返回按钮图片和文字颜色
        controller.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_black")?.zm.original
        controller.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_black")?.zm.original
        controller.navigationItem.backBarButtonItem =  UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
        controller.navigationController?.navigationBar.tintColor = UIColor.green
        
    }
}
