//
//  AutoLayoutViewController.swift
//  layout
//
//  Created by czm on 2020/6/30.
//  Copyright © 2020 czm. All rights reserved.
//
/**
 
 /**
  * item   被约束的view
  * attribute   被约束view的属性
  * relatedBy   被约束的view和参照view的关系
  * toItem  参照的view
  * attribute  参照view的属性
  * multiplier   乘数
  * constant   常量
  */
 NSLayoutConstraint(item: Any, attribute: NSLayoutConstraint.Attribute, relatedBy: NSLayoutConstraint.Relation, toItem: Any?, attribute: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant: CGFloat)
 
 
 //如下案例： 设置 4 个View 占据 VC.view 的四块
 
 */



import UIKit

class AutoLayoutViewController: UIViewController {
    
    lazy var subView1: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        v.tag = 1
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewJump(_:)))
        v.addGestureRecognizer(tap)
        return v
    }()

    lazy var subView2: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        v.tag = 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewJump(_:)))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    lazy var subView3: UIView = {
        let v = UIView()
        v.backgroundColor = .systemTeal
        v.tag = 3
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewJump(_:)))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    lazy var subView4: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        v.tag = 4
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewJump(_:)))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    let margin: CGFloat = 20
    let padding: CGFloat = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置从 navigationBar.bottom 下开始布局
        self.edgesForExtendedLayout = [.left, .right]
        self.extendedLayoutIncludesOpaqueBars = false
        
        view.backgroundColor = .white
        
        view.addSubview(subView1)
        view.addSubview(subView2)
        view.addSubview(subView3)
        view.addSubview(subView4)

        subView1.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint1()
        subView2.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint2()
        subView3.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint3()
        subView4.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint4()
        
        
        let label1 = createLabel("在 Xib 中实现多个子View整体居中")
        subView1.addSubview(label1)
        layoutLab(label1, subView1)
        
        let label2 = createLabel("autoLayout VFL语法的使用")
        subView2.addSubview(label2)
        layoutLab(label2, subView2)
        
        let label3 = createLabel("NSLayoutAnchor 布局锚点的使用")
        subView3.addSubview(label3)
        layoutLab(label3, subView3)
        
        let label4 = createLabel("SnapKit 框架的使用")
        subView4.addSubview(label4)
        layoutLab(label4, subView4)
    }
    
    func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        label.text = text
        return label
    }
    
    func layoutLab(_ label: UILabel, _ itemView: UIView) {
        let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: itemView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: itemView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let width = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: itemView, attribute: .width, multiplier: 0.8, constant: 0)
        let height = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: itemView, attribute: .height, multiplier: 0.9, constant: 0)
        itemView.addConstraints([centerY, centerX, width, height])
    }
    
    @objc func tapViewJump(_ gesture: UIGestureRecognizer) {
        let view = gesture.view
        switch view?.tag {
        case 1:
            navigationController?.pushViewController(AutoLayoutCenterViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(AutoLayoutVFLViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(AnchorLayoutViewController(), animated: true)
        default:
            navigationController?.pushViewController(SnapKitViewController(), animated: true)
        }
    }

    func setupConstraint1() {
        

        let left = NSLayoutConstraint(item: subView1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: margin)
        
        let width = NSLayoutConstraint(item: subView1, attribute: .width, relatedBy: .equal, toItem: subView2, attribute: .width, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: subView1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: margin)
        
        let height = NSLayoutConstraint(item: subView1, attribute: .height, relatedBy: .equal, toItem: subView3, attribute: .height, multiplier: 1.0, constant: 0)
        
        self.view.addConstraints([left, width, top, height])
    }
    
    func setupConstraint2() {
        
        let left = NSLayoutConstraint(item: subView2, attribute: .left, relatedBy: .equal, toItem: subView1, attribute: .right, multiplier: 1.0, constant: padding)
        
        let right = NSLayoutConstraint(item: subView2, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -margin)
        
        let top = NSLayoutConstraint(item: subView2, attribute: .top, relatedBy: .equal, toItem: subView1, attribute: .top, multiplier: 1, constant: 0)
        
        let height = NSLayoutConstraint(item: subView2, attribute: .height, relatedBy: .equal, toItem: subView1, attribute: .height, multiplier: 1, constant: 0)
        
        self.view.addConstraints([top, left, height, right])
    }
    
    func setupConstraint3() {
        
        let left = NSLayoutConstraint(item: subView3, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: margin)
        
        let width = NSLayoutConstraint(item: subView3, attribute: .width, relatedBy: .equal, toItem: subView4, attribute: .width, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: subView3, attribute: .top, relatedBy: .equal, toItem: subView1, attribute: .bottom, multiplier: 1.0, constant: padding)
        
        let bottom = NSLayoutConstraint(item: subView3, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -margin)
        
        self.view.addConstraints([left, width, top, bottom])
        
    }
    
    
    func setupConstraint4() {
        let left = NSLayoutConstraint(item: subView4, attribute: .left, relatedBy: .equal, toItem: subView3, attribute: .right, multiplier: 1.0, constant: padding)
        
        let right = NSLayoutConstraint(item: subView4, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -margin)
        
        let top = NSLayoutConstraint(item: subView4, attribute: .top, relatedBy: .equal, toItem: subView2, attribute: .bottom, multiplier: 1.0, constant: padding)
        
        let bottom = NSLayoutConstraint(item: subView4, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -margin)
        
        self.view.addConstraints([left, right, top, bottom])
        
    }
}
