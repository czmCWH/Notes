//
//  TabBarController.swift
//  BaseProject
//
//  Created by czm on 2020/4/23.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild("首页", "icon_tab_home_nor", "icon_tab_home_pre", MainViewController.self)
        addChild("分类", "icon_tab_project_nor", "icon_tab_project_pre", ProductViewController.self)
        addChild("发现", "icon_tab_more_nor", "icon_tab_more_pre", FindViewController.self)
        addChild("我的", "icon_tab_my_nor", "icon_tab_my_pre", MineViewController.self)
    }
    
    func addChild(_ title: String, _ image: String, _ selectedImage: String, _ type: UIViewController.Type) {
        let child = NavigationController(rootViewController: type.init())
        child.navigationItem.title = title
        child.tabBarItem.title = title
        child.tabBarItem.image = UIImage(named: image)?.zm.original
        child.tabBarItem.selectedImage = UIImage(named: selectedImage)?.zm.original
        child.tabBarItem.setTitleTextAttributes([
                   .foregroundColor: UIColor.zm.initHex(0xe60012)
               ], for: .selected)
        addChild(child)
    }
}
