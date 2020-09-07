//
//  ColorSpacesController.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class ColorSpacesController: UIViewController {
    
    let contextView = GraphicsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "颜色和颜色空间"
        view.backgroundColor = .gray
        edgesForExtendedLayout = [.left, .right]
        
        contextView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        contextView.backgroundColor = .white
        view.addSubview(contextView)
    }
    

}


class GraphicsView: UIView {
    override func draw(_ rect: CGRect) {
        
//        drawAlpha(rect)
        
        colorSpace(rect)
    }
    
    // 1、alpha和color
    func drawAlpha(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        // 设置全局alpha值。使得页面上的对象和其本身都透明
        context?.setAlpha(0.25)
        
        context?.beginPath()
        context?.addRect(CGRect(x: 50, y: 50, width: 100, height: 100))
        context?.setFillColor(UIColor.green.cgColor)
        // 为路径的单独颜色设置alpha，只会作用于当前路径
//        context?.setFillColor(UIColor.green.withAlphaComponent(0.5).cgColor)
        context?.fillPath()
        
        context?.beginPath()
        context?.addRect(CGRect(x: 75, y: 75, width: 50, height: 50))
        context?.setFillColor(UIColor.red.cgColor)
//        context?.setFillColor(UIColor.red.withAlphaComponent(0.5).cgColor)
        context?.fillPath()
        
        // 绘制透明矩形，该方法以显式清除图形上下文的alpha通道。例如，在为图标创建透明蒙版或使窗口背景透明时，可能要执行此操作。
        // 如果提供的上下文是window 或者 bitmap contex，则 Core Graphics 会清楚rect所表示的矩形
        // 如果是其它类型，Core Graphics以依赖于设备的方式填充矩形。
        // 注意，不应该在 window 或者 bitmap contex 以外的上下文中使用此函数。
        context?.clear(CGRect(x: 75, y: 75, width: 50, height: 50))
    }
    
    
    // 创建颜色空间
    func colorSpace(_ rect: CGRect) {
        
//        let graySpace = CGColorSpaceCreateDeviceGray()
//        let rgbSpace = CGColorSpaceCreateDeviceRGB()
//        let cmykSpace = CGColorSpaceCreateDeviceCMYK()
        
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        context?.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        context?.closePath()
        
        // 通过创建颜色空间来设置颜色
//        let rgbSpace = CGColorSpaceCreateDeviceRGB()
//        let values:[CGFloat] = [0.3, 1.0, 0.9, 1.0]
//        let color = CGColor(colorSpace: rgbSpace, components: values)!
//        context?.setFillColor(color)
        
        /* 设置渲染意图
         * .defaultIntent
         * .absoluteColorimetric
         * .relativeColorimetric
         * .perceptual
         * .saturation
         */
        context?.setRenderingIntent(.saturation)
        
        context?.setLineWidth(2.0)
        // 通过 Quartz 提供的便捷的方法来设置颜色
        context?.setStrokeColor(red: 237/225.0, green: 101/255.0, blue: 90/255.0, alpha: 1.0)
        context?.setFillColor(red: 245/255.0, green: 187/255.0, blue: 65/255.0, alpha: 1.0)
        context?.drawPath(using: .fillStroke)
        
        
    }
}
