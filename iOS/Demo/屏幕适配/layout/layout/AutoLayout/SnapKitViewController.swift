//
//  SnapKitViewController.swift
//  layout
//
//  Created by czm on 2020/7/7.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class SnapKitViewController: UIViewController {
    
    lazy var label: UILabel = {
        let lab = UILabel()
        lab.font = .systemFont(ofSize: 14)
        lab.backgroundColor = .red
        lab.text = "好好学习，天天向上，加油少年"
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var tealView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SnapKit"
        // 设置从 navigationBar.bottom 下开始布局
        self.edgesForExtendedLayout = [.left, .right]
        self.extendedLayoutIncludesOpaqueBars = false
        view.backgroundColor = .white
        
        
        view.addSubview(tealView)
        view.addSubview(label)
        
        tealView.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(50)
            make.leading.equalTo(label.snp.trailing).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(tealView.snp.centerY)
            make.width.lessThanOrEqualTo(100)
            
        }
        
//        let arr: [UIView] = [label, tealView]
//        arr.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 10, leadSpacing: 10, tailSpacing: 10)
    }
    

    
}
