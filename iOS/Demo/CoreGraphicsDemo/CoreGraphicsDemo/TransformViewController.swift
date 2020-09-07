//
//  TransformViewController.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/25.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Transforms变换"
        view.backgroundColor = .gray
        edgesForExtendedLayout = [.left, .right]
        
        let tView = TransformView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        tView.backgroundColor = .white
        view.addSubview(tView)
        
    }

}


class TransformView: UIView {
    override func draw(_ rect: CGRect) {
        
        
        
//        ctmFunc(rect)
        
        affineTransformContext(rect)
        
    }
    
    // CTM 进行平移、旋转、缩放
    func ctmFunc(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let imgRect = CGRect(x: 50, y:0 , width: 100, height: 180)
        
        
        // 平移，为旋转作准备
        context?.translateBy(x: imgRect.width + imgRect.origin.x * 2, y: imgRect.size.height + imgRect.origin.y * 2)
        
        // 以上下文的坐标原点(左上角)进行旋转。由于UIkit坐标系先对于 Quartz 2D 坐标系颠倒了y轴，所以旋转角度为正值顺时针旋转，负值逆时针
        context?.rotate(by: CGFloat.pi)
        
        // 把图片进行缩放，避免变形
        context?.scaleBy(x: 1.0, y: 0.5)
        
        /* 在指定区域内绘制图像，
         * rect：会不成比例的缩放图片，以适应rect参数指定的边界。
         * byTiling：为true，会以rect为起点，把图片平铺上下文的整个区域。
         */
        context?.draw((UIImage(named: "butterfly")?.cgImage!)!, in: imgRect, byTiling: false)
    }
    
    // 使用放射变换CGAffineTransform
    func affineTransformContext(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let imgRect = CGRect(x: 50, y:0 , width: 100, height: 180)
        
        var transform = CGAffineTransform(translationX: imgRect.origin.x * 2 + imgRect.size.width, y: imgRect.origin.y * 2 + imgRect.size.height)
        transform = transform.rotated(by: CGFloat.pi)
        transform = transform.scaledBy(x: 1.0, y: 0.5)

        // 使用指定的矩阵转换上下文中的用户坐标系统
        context?.concatenate(transform)

//        context?.scaleBy(x: 1.0, y: 1.0)
//        var transform = context?.ctm
//        transform = transform?.rotated(by: CGFloat.pi)
//        context?.concatenate(transform!)
        
        context?.draw((UIImage(named: "butterfly")?.cgImage!)!, in: imgRect)
        
    }
    
}
