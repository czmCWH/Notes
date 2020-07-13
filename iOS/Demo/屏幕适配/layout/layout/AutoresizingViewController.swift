//
//  AutoresizingViewController.swift
//  layout
//
//  Created by czm on 2020/6/30.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class AutoresizingViewController: UIViewController {
    
    
    // 通过 frame layout 方式布局
    lazy var greenView: FrameView = {
        let gV = FrameView()
        gV.backgroundColor = .green
        return gV
    }()
    
    
    lazy var orangeView: UIView = {
        let oV = UIView()
        oV.backgroundColor = .orange
        return oV
    }()
    
    lazy var contentView: UIView = {
        let ctV = UIView()
        ctV.backgroundColor = UIColor.purple
        return ctV
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Autoresizing"
        view.backgroundColor = .white
        
        view.addSubview(greenView)
        
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 150, y: 250, width: 80, height: 50)
        btn.backgroundColor = .cyan
        btn.setTitle("点击", for: .normal)
        btn.addTarget(self, action: #selector(clickChangeFrame), for: .touchUpInside)
        view.addSubview(btn)
        
        
        view.addSubview(orangeView)
        orangeView.addSubview(contentView)
        orangeView.frame = CGRect(x: 50, y: 350, width: 100, height: 100)
        
        // 设置 ContentView 的 autoresizing
        contentView.frame = CGRect(x: 50, y: 0, width: 50, height: 100)
       
        
        /*
         autoresizingMask：它的值决定View如何根据其 superView.frame 发生变化时如何调整自身大小
         
            flexibleLeftMargin

            flexibleWidth

            flexibleRightMargin

            flexibleTopMargin

            flexibleHeight

            flexibleBottomMargin
         */
        // 设置当 orangeView 的frame变化时，contentView 的 左间距、宽度、高度进行伸缩调整
        contentView.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth, .flexibleHeight]
        
                
        // 默认值为: true
        // ture 表示 允许 视图的 subView 根据其设置的 autoresizingMask 进行伸缩调整
        // orangeView.autoresizesSubviews = false
        
        
        // 把对View设置的 autoresizingMask 转换为 Constraints
        // ture：表示可以把 frame ，bouds，center 方式布局的视图自动转化为 “自动布局约束” 形式
        // 通过代码创建的 view，其默认值为 ture
        // 通过 Interface Builder 中添加的 View，其默认值为 fale
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        greenView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }

    
    /// 改变 orangeView的 width、height
    @objc func clickChangeFrame() {
        orangeView.frame.size.width += 20
        orangeView.frame.size.height += 20
//        print(orangeView.frame)
    }
}



class FrameView: UIView {
    let leftView = UIView()
    let rightView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        leftView.backgroundColor = .red
        rightView.backgroundColor = .orange
        
        addSubview(leftView)
        addSubview(rightView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let width = (self.bounds.size.width - margin * 2 - padding) / 2
        let height = self.bounds.size.height - margin * 2
        
        print(width, height)
        
        leftView.frame = CGRect(x: margin, y: margin, width: width, height: height)
        rightView.frame = CGRect(x: margin + width + padding, y: margin, width: width, height: height)
        
    }
    
}

