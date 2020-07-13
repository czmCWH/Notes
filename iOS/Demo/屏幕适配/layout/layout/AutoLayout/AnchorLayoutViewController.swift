//
//  AnchorLayoutViewController.swift
//  layout
//
//  Created by czm on 2020/7/7.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class AnchorLayoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "AnchorLayout"
        // 设置从 navigationBar.bottom 下开始布局，可以参照 topLayoutGuide
//        self.edgesForExtendedLayout = [.left, .right]
//        self.extendedLayoutIncludesOpaqueBars = false
        
        

        
        view.backgroundColor = .white
        
        
//        setupLayoutAnchor()
        setupLayoutMarginsGuide()
//        useLayoutGuide()
//        useLayoutGuideContainer()
        
    
        if #available(iOS 11.0, *) {
            print(self.view.safeAreaInsets)
        } else {
            
        }
        
        
        
        
    }
    
    // 使用 NSLayoutAnchor 进行布局
    func setupLayoutAnchor() {
        let orangeView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .orange
            return view
        }()

        let tealView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemTeal
            return view
        }()
        
        view.addSubview(orangeView)
        view.addSubview(tealView)
        
        let constraints = [
            orangeView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 20),
            orangeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            orangeView.widthAnchor.constraint(equalTo: tealView.widthAnchor, multiplier: 1.0, constant: 0),
            orangeView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
                
        tealView.topAnchor.constraint(equalTo: orangeView.topAnchor).isActive = true
        tealView.leadingAnchor.constraint(equalTo: orangeView.trailingAnchor, constant: 20).isActive = true
        tealView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tealView.heightAnchor.constraint(equalTo: orangeView.heightAnchor).isActive = true
        
    }
    
    // view.layoutMarginsGuide 对布局的影响
    // view.layoutMarginsGuide.leadingAnchor 会多出 16 个点的间隔
    // 虽然文档上说的UIView不会提供布局的边距锚点，可以通过layoutMarginGuide来获取，但这样的布局是有一个margin的，默认是16。
    // 如果不使用layoutMarginGuide，直接使用self.view.leftAnchor也是可以进行锚点布局，的这时候就不会有一个20的间距了。
    func setupLayoutMarginsGuide() {
        
        let redView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .red
            return view
        }()
        
        let greenView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .green
            return view
        }()
        
        view.addSubview(redView)
        view.addSubview(greenView)

        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        redView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let margin = self.view.layoutMarginsGuide
        greenView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 20).isActive = true
        greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20).isActive = true
        greenView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20).isActive = true
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.0).isActive = true
    }
    
    
    // 使用 UILayoutGuide 作为布局中视图之间空白空间的大小或位置，使得3个View等间距分布
    func useLayoutGuide() {
         let orangeView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .orange
            return view
        }()

        let tealView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemTeal
            return view
        }()
        
        let redView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .red
            return view
        }()
        
        view.addSubview(orangeView)
        view.addSubview(tealView)
        view.addSubview(redView)
        // 1、实例化UILayoutGuide
        let space1 = UILayoutGuide()
        // 2、将UILayoutGuide添加到View，作为虚拟视图使用
        view.addLayoutGuide(space1)
         
        let space2 = UILayoutGuide()
        view.addLayoutGuide(space2)
         
        // UILayoutGuide 作为空白空间的核心代码
        space1.widthAnchor.constraint(equalTo: space2.widthAnchor).isActive = true
        orangeView.trailingAnchor.constraint(equalTo: space1.leadingAnchor).isActive = true
        tealView.leadingAnchor.constraint(equalTo: space1.trailingAnchor).isActive = true
        tealView.trailingAnchor.constraint(equalTo: space2.leadingAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: space2.trailingAnchor).isActive = true
        
        orangeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        orangeView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 50).isActive = true
        redView.topAnchor.constraint(equalTo: orangeView.topAnchor).isActive = true
        tealView.topAnchor.constraint(equalTo: orangeView.topAnchor).isActive = true

        orangeView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        redView.widthAnchor.constraint(equalTo: orangeView.widthAnchor).isActive = true
        tealView.widthAnchor.constraint(equalTo: orangeView.widthAnchor).isActive = true

        orangeView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        redView.heightAnchor.constraint(equalTo: orangeView.heightAnchor).isActive = true
        tealView.heightAnchor.constraint(equalTo: orangeView.heightAnchor).isActive = true
        
    }
    
    // 使用 UILayoutGuide 作为一个布局容器，使得一组子View居中
    func useLayoutGuideContainer() {
        let tealView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemTeal
            return view
        }()
        
        let label: UILabel = {
            let lab = UILabel()
            lab.font = .systemFont(ofSize: 14)
            lab.backgroundColor = .red
            lab.text = "好好学习，天天向上，加油少年"
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.textAlignment = .center
            lab.numberOfLines = 0
            return lab
        }()
        
        view.addSubview(tealView)
        view.addSubview(label)
        
        // 1、实例化UILayoutGuide
        let container = UILayoutGuide()
        // 2、将UILayoutGuide添加到View，作为虚拟视图使用
        view.addLayoutGuide(container)
        let margins = view.layoutMarginsGuide
        // 3、通过 Auto Layout 设置 UILayoutGuide 的位置和大小
        container.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        container.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 20.0).isActive = true
        
        // 设置 UILayoutGuide的内部约束
        label.centerYAnchor.constraint(equalTo: tealView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true

        tealView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8.0).isActive = true
        tealView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        tealView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        tealView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        tealView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tealView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}




