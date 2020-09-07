//
//  ShadowViewController.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/27.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class ShadowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "阴影的使用"
        view.backgroundColor = .gray
        edgesForExtendedLayout = [.left, .right]
        
        let shadowV = ShadowView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        shadowV.backgroundColor = .white
//        view.addSubview(shadowV)
        
        let gradientV = GradientView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        gradientV.backgroundColor = .white
//        view.addSubview(gradientV)
        
        let transparencyV = TransparencyView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        transparencyV.backgroundColor = .white
        view.addSubview(transparencyV)
        
    }
    
}

// MARK:- 阴影
class ShadowView: UIView {
    override func draw(_ rect: CGRect) {
            
        let context = UIGraphicsGetCurrentContext()
        
        context?.saveGState()   // 保存图形状态
        let shadowOffset = CGSize(width: -15, height: 20)
        
        // 方式一：设置默认黑色阴影
        context?.setShadow(offset: shadowOffset, blur: 5)
        context?.setFillColor(red: 0, green: 1, blue: 0, alpha: 1)
        
        context?.fill(CGRect(x: 50, y: 50, width: 50, height: 50))
        
        // 方式二：设置彩色阴影
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let values:[CGFloat] = [1, 0, 0, 0.6]
        let color = CGColor(colorSpace: colorSpace, components: values)
        context?.setShadow(offset: shadowOffset, blur: 5, color: color)
        
        
        context?.setFillColor(red: 0, green: 0, blue: 1, alpha: 1)
        context?.fill(CGRect(x: 80, y: 100, width: 50, height: 50))
        
        context?.restoreGState()    // 恢复图形状态
    }
}

// MARK:- 渐变
class GradientView: UIView {
    override func draw(_ rect: CGRect) {
        
        
//        CGGradient
//
//        CGShading
        
        // 1、CGGradient的线性渐变
//        drawLineCGGradient(rect)
        
        // 2、CGGradient的径向渐变
//        drawRadialGradient(rect)
    
//        drawLineRadialGradient(rect)
        
//        let colorspace = CGColorSpaceCreateDeviceRGB()
//
//        let numComponents = 1 + colorspace.numberOfComponents
//        let input_value_range = [0, 1]
//        let output_value_range = [0, 1, 0, 0, 0, 0, 1, 1]
//
//       let callbacks = CGFunctionCallbacks(version: 0, evaluate: calculateShadingValues, releaseInfo: nil)
//
//
//        // 设置CGFunction对象来计算颜色值
//        let cgfunc = CGFunction(info: <#T##UnsafeMutableRawPointer?#>, domainDimension: <#T##Int#>, domain: <#T##UnsafePointer<CGFloat>?#>, rangeDimension: <#T##Int#>, range: <#T##UnsafePointer<CGFloat>?#>, callbacks: <#T##UnsafePointer<CGFunctionCallbacks>#>)
//
//
//        let shading = CGShading(axialSpace: <#T##CGColorSpace#>, start: <#T##CGPoint#>, end: <#T##CGPoint#>, function: <#T##CGFunction#>, extendStart: <#T##Bool#>, extendEnd: <#T##Bool#>)
        
    }
    
    
    
    
    // 1、创建 CGGradient 线性渐变
    func drawLineCGGradient(_ rect: CGRect) {
        
        let colorSpace = CGColorSpace(name: CGColorSpace.genericRGBLinear)
        let components: [CGFloat] = [1.0, 0, 0, 1.0,    // start color 红色
                                    0, 0, 1.0, 1.0]    // end color 蓝色
        let locations: [CGFloat] = [0.0, 1.0]
        
        /// 根据相关的参数创建 CGGradient 对象
        /// - Parameters:
        ///   - space: 用于渐变的颜色空间。不能使用 Indexed and Pattern ColorSpace
        ///   - components: 定义渐变的每种颜色的颜色组成部分
        ///   - locations: 为components中每种颜色提供的位置。取值范围为0~1，如果该数组中不包括0和1，则Quartz将为这些位置使用最接近0和1的颜色。
        ///   - count: 提供的位置(locations)个数
        let gradient = CGGradient(colorSpace: colorSpace!, colorComponents: components, locations: locations, count: 2)
        
        
        let context = UIGraphicsGetCurrentContext()
        
        let startPt = CGPoint(x: 0, y: 0)
        let endPt = CGPoint(x: rect.width, y: rect.height)
        
        
        /// 绘制渐变填充
        /// - Parameters:
        ///   - gradient: 渐变对象
        ///   - startPoint: 定义渐变起点的坐标
        ///   - endPoint: 定义渐变终点的坐标
        ///   - options:用于控制填充是延伸到起点还是终点之外。如： drawsBeforeStartLocation 表示填充超出起始的颜色，该颜色为CGGradient中定义locations位于0的纯色
        context?.drawLinearGradient(gradient!, start: startPt, end: endPt, options: .drawsBeforeStartLocation)
        
    }
    
    // 2、创建 CGGradient 径向渐变
    func drawRadialGradient(_ rect: CGRect) {
        let colorSpace = CGColorSpace(name: CGColorSpace.genericRGBLinear)
        let components: [CGFloat] = [1.0, 0, 0, 1.0,    // start color
            0, 0, 1.0, 1.0]    // end color
        let locations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorSpace: colorSpace!, colorComponents: components, locations: locations, count: 2)
        
        let context = UIGraphicsGetCurrentContext()
        
        let startCenter = CGPoint(x: 50, y: 50)
        let startRd: CGFloat = 25
        let endCenter = CGPoint(x: 150, y: 150)
        let endRd: CGFloat = 50
        
        /// 绘制沿提供的起始圆和结束圆定义的区域变化的渐变填充
        /// - Parameters:
        ///   - gradient: 渐变对象
        ///   - startCenter: 起始圆中心的坐标
        ///   - startRadius: 起始圆的半径
        ///   - endCenter: 结束圆中心的坐标
        ///   - endRadius: 结束圆的半径
        ///   - options: 用于控制渐变是在开始圆之前绘制还是在结束圆之后绘制。
        context?.drawRadialGradient(gradient!, startCenter: startCenter, startRadius: startRd, endCenter: endCenter, endRadius: endRd, options: .drawsBeforeStartLocation)
    }
    
    func drawLineRadialGradient(_ rect: CGRect) {
        let colorSpace = CGColorSpace(name: CGColorSpace.genericRGBLinear)
        let components: [CGFloat] = [1.0, 0, 0, 1.0,    // start color
            0, 0, 1.0, 1.0]    // end color
        let locations: [CGFloat] = [0.0, 1.0]

        let gradient = CGGradient(colorSpace: colorSpace!, colorComponents: components, locations: locations, count: 2)

        let context = UIGraphicsGetCurrentContext()

        let startPt = CGPoint(x: 0, y: 0)
        let endPt = CGPoint(x: rect.width, y: rect.height)
        context?.drawLinearGradient(gradient!, start: startPt, end: endPt, options: .drawsBeforeStartLocation)
        
        let startCenter = CGPoint(x: 50, y: 50)
        let startRd: CGFloat = 25
        let endCenter = CGPoint(x: 150, y: 150)
        let endRd: CGFloat = 50
        context?.drawRadialGradient(gradient!, startCenter: startCenter, startRadius: startRd, endCenter: endCenter, endRadius: endRd, options: .drawsBeforeStartLocation)
    }
    
}

// MARK:- 透明层
class TransparencyView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let shadowOffset = CGSize(width: 10, height: 20)
        context?.setShadow(offset: shadowOffset, blur: 10)
        
        let wd = rect.width
        let ht = rect.height
        
        // 透明层开始
        // 指定上下文中的所有后续绘图操作都被组合到一个完全透明的背景中
//        context?.beginTransparencyLayer(auxiliaryInfo: nil)
        
        context?.setFillColor(red: 0, green: 1, blue: 0, alpha: 1)
        context?.fill(CGRect(x: wd/3 + 50, y: ht/2, width: 50, height: 50))

        context?.setFillColor(red: 1, green: 0, blue: 0, alpha: 1)
        context?.fill(CGRect(x: wd/3 + 25, y: ht/2 - 25, width: 50, height: 50))
        
        context?.setFillColor(red: 0, green: 0, blue: 1, alpha: 1)
        context?.fill(CGRect(x: wd/3, y: ht/4, width: 50, height: 50))
        
        // 结束透明层
        // 使用上下文的全局alpha和阴影状态将结果合成到上下文中
//        context?.endTransparencyLayer()
        
    }
}
