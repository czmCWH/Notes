//
//  StackViewController.swift
//  layout
//
//  Created by czm on 2020/7/8.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        // 子视图排列轴的方向：水平 或者 垂直
        stack.axis = .horizontal
        // 垂直于axis方向，子视图对齐方式
        stack.alignment = .center
        /*  调整子视图的大小，以便它们填充可用空间
        fill    子视图填充排列轴可用空间，多个视图时以第一个 addArrangedSubview的视图 拉伸填充
        fillEqually     子视图沿着排列轴等宽或等高填充
        fillProportionally      根据 StackView 的大小，调整子视图按比例调整大小填充可用空间
        equalSpacing    子视图等间距填充
        equalCentering  子视图等中点填充
         */
        stack.distribution = .fill
        /* 子视图之间的间距
            当 distribution == equalSpacing ｜equalCentering 时，它的值为其最小间距
        */
        stack.spacing = 10
        
        //设置布局时是否参照基线
        //stack.isBaselineRelativeArrangement = true
        
        // 设置布局时是否以控件的 LayoutMargins 为标准，默认为NO，是以控件的bounds为标准
        //stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var label: UILabel = {
        let lab = UILabel()
        lab.font = .systemFont(ofSize: 14)
        lab.backgroundColor = .red
        lab.text = "好好学习天天向上加油少年"
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var tealView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    lazy var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "StackView"
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(tealView)
        stackView.addArrangedSubview(orangeView)
        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickPrint)))
        
        stackView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
 
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(tealView.snp.centerY)
            make.width.lessThanOrEqualTo(80)
        }
        
//        if #available(iOS 11.0, *) {
//            stackView.setCustomSpacing(20, after: label)
//        }
        
        tealView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
//            make.leading.equalTo(label.snp.trailing).offset(20)
        }
        
//        if #available(iOS 11.0, *) {
//            stackView.setCustomSpacing(40, after: tealView)
//        }
        
        orangeView.snp.makeConstraints { (make) in
            make.width.height.equalTo(tealView).multipliedBy(0.5)
//            make.leading.equalTo(tealView.snp.trailing).offset(40)
        }
        
        
        
        
        let tealv = UIView()
        tealv.backgroundColor = .systemTeal
        view.addSubview(tealv)
        tealv.snp.makeConstraints { (make) in
            make.trailing.equalTo(tealView.snp.trailing)
            make.width.height.equalTo(100)
            make.bottom.equalTo(stackView.snp.top).offset(-100)
        }
        
    }
    
    @objc func clickPrint() {
        print(#function)
    }
    
}
