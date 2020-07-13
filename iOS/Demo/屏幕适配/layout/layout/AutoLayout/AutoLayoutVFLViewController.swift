//
//  AutoLayoutVFLViewController.swift
//  layout
//
//  Created by czm on 2020/7/2.
//  Copyright © 2020 czm. All rights reserved.
//

// 语法复杂：https://blog.csdn.net/qq_14920635/article/details/81567121


import UIKit

class AutoLayoutVFLViewController: UIViewController {
    
    lazy var subView1: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VFL";
        view.backgroundColor = .white
        
        view.addSubview(subView1)
        subView1.translatesAutoresizingMaskIntoConstraints = false
        setupVFLConstraint1()
        
    }
    

    func setupVFLConstraint1() {
        
        
//        NSLayoutConstraint.constraints(withVisualFormat: <#T##String#>, options: <#T##NSLayoutConstraint.FormatOptions#>, metrics: <#T##[String : Any]?#>, views: <#T##[String : Any]#>)
//        
//        /**
//         * withVisualFormat ：VFL字符串，用于定义约束规范
//         * options：描述 VFL字符串 中所有对象的属性和布局方向的选项
//         * metrics：出现在 VFL字符串 中的常量字典。该字典的 key 必须为 VFL字符串 中的字符串，value 必须为 NSNumer 类型
//         * views：
//         */
//        NSLayoutConstraint.constraints(withVisualFormat: String, options: NSLayoutConstraint.FormatOptions, metrics: [String : Any]?, views: [String : Any])
    }
    
}
