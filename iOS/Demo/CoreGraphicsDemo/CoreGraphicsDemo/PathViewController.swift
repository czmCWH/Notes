//
//  TestViewController.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/19.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class PathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "test"
        view.backgroundColor = UIColor.gray
        edgesForExtendedLayout = [.left, .right]
        
        
        let pathView = PathView(frame: CGRect(x: 50, y: 200, width: 200, height: 200))
        pathView.backgroundColor = .systemPink
//        view.addSubview(pathView)
        
        let mutPathView = CreatePathView(frame: CGRect(x: 50, y: 200, width: 200, height: 200))
        mutPathView.backgroundColor = UIColor.white
        view.addSubview(mutPathView)
    }

}

// MARK: - 颜色和颜色空间
class PathColorView: UIView {
    override func draw(_ rect: CGRect) {
        
    }
}


// MARK: - 创建路径
class CreatePathView: UIView {
    
    override func draw(_ rect: CGRect) {
        
//        drawLineStrokeParameters()
        
//        drawStrokeFunc()
        
//        drawFillPath()
        
        antiAliasingFill()
        
//        drawBlendMode()
        
//        imageWithBlend()
        
//        clipWithPath(rect)
    }
    
    // 影响描边的参数
    func drawLineStrokeParameters() {
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.addLine(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 150))
        
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path)
        
        // 设置描边时的线宽，默认值为1.0。路径两边为总宽度的一半。
        context?.setLineWidth(15)
        
        // 线条连接的样式，默认值为 .miter
        // .miter(斜接，类似相框一样)  .round(一个半圆弧连接)  .bevel(斜角，末端为方形的连接)
//        context?.setLineJoin(CGLineJoin.miter)
        
        // 设置线的端点的样式，默认值为.butt
        // .butt(末端为方形) .round(末端为圆弧)  .square(末端为方形，线长会扩展到路径端点之外的距离等于线宽的一半)
        context?.setLineCap(CGLineCap.butt)
        
        // 如果线的连接方式为：CGLineJoin.miter, 它的值决定是否应使用.bevel而不是.miter连接线。
        // 如果 斜接的长度除以线宽 大于 MiterLimit，则线的连接方式为：.bevel
//        context?.setMiterLimit(5)
        
        // 设置绘制虚线的模式。注意设置 setLineCap 对虚线的影响
        // phase：指绘制前按照 lengths 模式跳过的距离，开始绘制
        // lengths：表示虚线如何进行虚实交替绘制。即按照lengths数组的元素长度依次循环绘制线段，并且每个线段虚实交替
        context?.setLineDash(phase: 0, lengths: [5, 10, 15])
        
        // 设置图形上下文的描边颜色空间
        context?.setStrokeColorSpace(CGColorSpaceCreateDeviceRGB())
        
        // 设置描边颜色
        context?.setStrokeColor(UIColor.yellow.cgColor)
    
        // 描边当前路径
        context?.strokePath()
        
        // 指定图形上下文中的描边模式
//        context?.setStrokePattern(<#T##pattern: CGPattern##CGPattern#>, colorComponents: <#T##UnsafePointer<CGFloat>#>)
    }
    
    // 描边的方式
    func drawStrokeFunc() {
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 75, y: 150))
        
        
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path)
        context?.setLineWidth(2)
        context?.setStrokeColor(UIColor.black.cgColor)
        
        // 描边当前路径
        context?.strokePath()
        
        // 以指定模式描画当前路径，取值有：.fill .eoFill .stroke .fillStroke .eoFillStroke
//        context?.drawPath(using: CGPathDrawingMode.fill)

        // 描边指定矩形
        context?.stroke(CGRect(x: 100, y: 100, width: 50, height: 50))

        // 指定的线宽描边指定的矩形
        context?.stroke(CGRect(x: 20, y: 100, width: 50, height: 50), width: 5)

        // 描边指定矩形内的椭圆
        context?.strokeEllipse(in: CGRect(x: 0, y: 0, width: 50, height: 100))

        // 描边指定的线条
        context?.strokeLineSegments(between: [CGPoint(x: 200, y: 0), CGPoint(x: 0, y: 200)])
        
    }
    
    // 填充路径
    func drawFillPath() {
        
        let outPath = CGMutablePath()
        outPath.addArc(center: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)

        let inPath = CGMutablePath()
        inPath.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        
        let basePath = CGMutablePath()
        basePath.addPath(outPath)
        basePath.addPath(inPath)
        
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(basePath)
        context?.setFillColor(UIColor.yellow.cgColor)
        
        // 等价于 context?.fillPath(using: .winding)
        context?.fillPath()
        
        /* 按照指定的填充规则在当前路径中绘制区域。如果当前路径包含任何未关闭的子路径，则此方法将把每个未关闭的子路径视为以使用 closePath()方法关闭，并按照指定的规则来确定要填充的区域进行填充。填充路径后，此方法清除上下文的当前路径。
         * .winding，将会采用用nonzero winding number rule方式填充
         * .evenOdd，将会采用even-odd rule方式填充绘制
         */
//        context?.fillPath(using: .evenOdd)
        
        
        
        // 只填充指定矩形的区域，不会填充路径
//        context?.fill(CGRect(x: 100, y: 100, width: 100, height: 50))
        
        // 只填充指定矩形内的椭圆
//        context?.fillEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 50))
        
        /* 根据相应的模式绘制当前路径
         * .fill 等价于 context?.fillPath(using: .winding)
         * .eofill 使用 even-odd rule 规则填充路径
         * .stroke 沿着路径渲染一条线
         * .fillStroke 首先使用nonzero winding number rule填充，然后描边
         * .eoFillStroke 首even-odd rul填充，然后描边路径。
         */
//        context?.drawPath(using: .eoFillStroke)
    
    }
    
    // 抗锯齿
    func antiAliasingFill() {
        
        var scaleT = CGAffineTransform(scaleX: 1.5, y: 1.5)
        let path = CGPath(roundedRect: CGRect(x: 25, y: 25, width: 100, height: 100), cornerWidth: 20, cornerHeight: 30, transform: &scaleT)
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path)
        
        // 设置图形上下文的反锯齿打开或关闭
        // 默认情况下，当创建 window or bitmap context 时，值为true；其它类型的上下文值为 false
        context?.setShouldAntialias(true)
        
        // 是否允许图形上下文的反锯齿
        // 如果 allowsAntialiasing 和 shouldAntialias 值都为 true，则Core Graphics 将对 图形上下文执行反锯齿处理
        context?.setAllowsAntialiasing(true)
        
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(UIColor.red.cgColor)
        context?.drawPath(using: .fillStroke)
    }
    
    // 混合模式
    func drawBlendMode() {
        
        let context = UIGraphicsGetCurrentContext()
        // 绘制背景矩形
        context?.beginPath()
        context?.setFillColor(red: 207 / 255.0, green: 194 / 255.0, blue: 141 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 50, width: 200, height: 25))
        context?.fillPath()
        context?.setFillColor(red: 201 / 255.0, green: 202 / 255.0, blue: 204 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 75, width: 200, height: 25))
        context?.fillPath()
        context?.beginPath()
        context?.setFillColor(red: 227 / 255.0, green: 106 / 255.0, blue: 161 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 100, width: 200, height: 25))
        context?.fillPath()
        context?.setFillColor(red: 165 / 255.0, green: 219 / 255.0, blue: 102 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 125, width: 200, height: 25))
        context?.fillPath()
        
        // 设置混合模式
        context?.setBlendMode(.difference)
        
        // 绘制背景矩形
        context?.beginPath()
        context?.setFillColor(red: 168 / 255.0, green: 127 / 255.0, blue: 180 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 50, y: 0, width: 25, height: 200))
        context?.fillPath()
        context?.beginPath()
        context?.setFillColor(red: 234 / 255.0, green: 153 / 255.0, blue: 58 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 75, y: 0, width: 25, height: 200))
        context?.fillPath()
        context?.beginPath()
        context?.setFillColor(red: 62 / 255.0, green: 148 / 255.0, blue: 218 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 100, y: 0, width: 25, height: 200))
        context?.fillPath()
        context?.beginPath()
        context?.setFillColor(red: 165 / 255.0, green: 219 / 255.0, blue: 102 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 125, y: 0, width: 25, height: 200))
        context?.fillPath()
    }
    
    // 混合模式用在图片上
    func imageWithBlend() {
        
        let context = UIGraphicsGetCurrentContext()
        // 绘制背景矩形
        context?.beginPath()
        context?.setFillColor(red: 207 / 255.0, green: 194 / 255.0, blue: 141 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 50, width: 200, height: 25))
        context?.fillPath()
        context?.setFillColor(red: 201 / 255.0, green: 202 / 255.0, blue: 204 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 75, width: 200, height: 25))
        context?.fillPath()
        context?.beginPath()
        context?.setFillColor(red: 227 / 255.0, green: 106 / 255.0, blue: 161 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 100, width: 200, height: 25))
        context?.fillPath()
        context?.setFillColor(red: 165 / 255.0, green: 219 / 255.0, blue: 102 / 255.0, alpha: 1.0)
        context?.addRect(CGRect(x: 0, y: 125, width: 200, height: 25))
        context?.fillPath()
        
        // 设置混合模式
        context?.setBlendMode(.difference)
        
        context?.textMatrix = .identity
        
        context?.translateBy(x: 0, y: 200)
        context?.scaleBy(x: 1.0, y: -1.0)
        // CGContextDrawImage
        context?.draw((UIImage(named: "butterfly")?.cgImage)!, in: CGRect(x: 50, y: 70, width: 100, height: 75))
        
    }
    
    // 裁剪到路径
    func clipWithPath(_ rect: CGRect) {
         
        let context = UIGraphicsGetCurrentContext()
        
//        evenOddClip(rect, context)
//        clipRect(rect, context)
        maskRectclip(rect, context)

        drawGradient(rect, context)

        
    }
    // 创建圆环裁剪路径
    func evenOddClip(_ rect: CGRect, _ context: CGContext?) {
        // 创建一个矩形的裁剪区域
         context?.beginPath()
         // 绘制一个同心圆
        let arcCenter = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2.0)
        context?.addArc(center: arcCenter, radius: 80, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi*2), clockwise: false)
        context?.addArc(center: arcCenter, radius: 40, startAngle: CGFloat(Double.pi*2), endAngle: CGFloat(0), clockwise: true)
        context?.closePath()
//        context?.clip() 等价于 context?.clip(using: .winding)
        // 根据规则修改裁剪路径
        context?.clip(using: .evenOdd)
    }
    
    // 2、根据指定rect与当前裁剪区域相交，在进行裁剪
    func clipRect(_ rect: CGRect, _ context: CGContext?) {
        context?.beginPath()
        let arcCenter = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        context?.addArc(center: arcCenter, radius: 50, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        context?.closePath()
        // 设置绘制的路径为裁剪路径
        context?.clip()
        // 将剪切路径设置为 当前剪切路径 与 由指定矩形定义的区域 的交点
        context?.clip(to: CGRect(x: arcCenter.x, y: arcCenter.y, width: 100, height: 100))
    }
    
    // 3、将mask与当前裁剪区域相交，再进行裁剪
    func maskRectclip(_ rect: CGRect, _ context: CGContext?) {
        context?.beginPath()
        context?.addRect(rect)
        context?.closePath()
        context?.clip()
        // 将遮罩映射到指定的矩形，并将其与图形上下文的当前剪切区域相交。
        context?.clip(to: CGRect(x: 50, y: 50, width: 100, height: 100), mask: (UIImage(named: "ear")?.cgImage!)!)
    }
    
    // 绘制渐变背景
    func drawGradient(_ rect: CGRect, _ context: CGContext?) {
        let colorSpace = CGColorSpace(name: CGColorSpace.genericRGBLinear)
        let components: [CGFloat] = [1.0, 0, 0, 1.0,    // start color 红色
                                    1.0, 1.0, 0.0, 1.0]    // end color 蓝色
        let locations: [CGFloat] = [0.3, 0.8]
        let gradient = CGGradient(colorSpace: colorSpace!, colorComponents: components, locations: locations, count: 2)
        let startPt = CGPoint(x: 0, y: 0)
        let endPt = CGPoint(x: rect.width, y: rect.height)
        context?.drawLinearGradient(gradient!, start: startPt, end: endPt, options: .drawsBeforeStartLocation)
    }
    
}

// MARK: - 绘制路径
class PathView: UIView {
    override func draw(_ rect: CGRect) {
//        CGContextRef ctx = UIGraphicsGetCurrentContext();
//        CGContextMoveToPoint(ctx, 0, 50);
//        CGContextAddLineToPoint(ctx, 100, 100);
//        CGContextAddLineToPoint(ctx, 0, 200);
//        CGContextClosePath(ctx);

        
//        let width = frame.size.width
//        let height = frame.size.height
        
        drawLine()
//        drawArc()
//        drawCircle()
//        drawPointArc()
//        drawCurve()
//        drawQuadCurve()
//        drawSharp()

    }
    
    // 画点、线
    func drawLine() {
        let context = UIGraphicsGetCurrentContext()
        // 在当前图形上下文中开始一个路径
        context?.beginPath()
        // 在指定的点开始一个新的子路径，该点将成为新子路径的起始点
        context?.move(to: CGPoint(x: 0, y: 50))
        // 从当前点追加一条直线线段到指定点
        context?.addLine(to: CGPoint(x: 100, y: 150))
        context?.addLine(to: CGPoint(x: 80, y: 100))
        // 关闭当前路径的子路径，连接路径的起始点
        context?.closePath()
        
        let points = [CGPoint(x: 100, y: 100), CGPoint(x: 150, y: 100), CGPoint(x: 100, y: 50)]
        // 将已连接的直线段添加到当前路径
        context?.addLines(between: points)
//        context?.closePath()
        
        // 描边路径，沿着当前路径绘制一条线
        context?.strokePath()
        // 填充路径，按照指定的填充规则在当前路径中绘制区域
//        context?.fillPath()
    }
    
    // 指定圆心，半径和径向角度画圆弧
    func drawArc() {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        context?.beginPath()
        // 在当前路径上添加圆弧，clockwise: true表示顺时针方向画圆弧
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle:0, endAngle: -CGFloat.pi / 2, clockwise: false)
        // 闭合路径
        context?.closePath()
        context?.restoreGState()
        context?.strokePath()
    }
    
    // 画正圆
    func drawCircle() {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        context?.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        context?.strokePath()
    }
    
    // 根据半价和两条切线画圆弧
    // 此函数常用于绘制圆角矩形的角
    func drawPointArc() {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        // 设置起点
        context?.move(to: CGPoint(x: 0, y: 100))
        // 设置半价
        let radius: CGFloat = 100
        // 绘制左上角
        context?.addArc(tangent1End: CGPoint(x: 0, y: 0), tangent2End: CGPoint(x: 100, y: 0), radius: radius)
        // 绘制右上角
        context?.addArc(tangent1End: CGPoint(x: 200, y: 0), tangent2End: CGPoint(x: 200, y: 100), radius: radius)
        // 绘制右下角
        context?.addArc(tangent1End: CGPoint(x: 200, y: 200), tangent2End: CGPoint(x: 100, y: 200), radius: radius)
        // 绘制左下角
        context?.addArc(tangent1End: CGPoint(x: 0, y: 200), tangent2End: CGPoint(x: 0, y: 100), radius: radius)
        context?.closePath()

        context?.strokePath()
    }
    
    // 三次贝塞尔曲线
    func drawCurve() {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        context?.move(to: CGPoint(x: 0, y: 100))
        // 使用指定的端点和控制点，向当前路径添加三次贝塞尔曲线
        // 该方法构造一条曲线，从路径的当前点开始，到指定的端点结束，曲率由两个控制点定义
        context?.addCurve(to: CGPoint(x: 200, y: 100), control1: CGPoint(x: 50, y: 50), control2: CGPoint(x: 150, y: 150))
        context?.closePath()
        context?.strokePath()
    }
    
    // 二次贝塞尔曲线
    func drawQuadCurve() {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        context?.move(to: CGPoint(x: 0, y: 100))
        // 使用指定的端点和控制点，向当前路径添加二次贝塞尔曲线
        context?.addQuadCurve(to: CGPoint(x: 200, y: 100), control: CGPoint(x: 100, y: 0))
        context?.strokePath()
    }
    
    
    // 画矩形、矩形的内切椭圆
    func drawSharp() {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        // 将矩形路径添加到当前路径
        context?.addRect(CGRect(x: 50, y: 50, width: 100, height: 100))
        
        // 向当前路径添加一组矩形路径
        let rects = [CGRect(x: 0, y: 50, width: 50, height: 50), CGRect(x: 100, y: 0, width: 50, height: 50), CGRect(x: 150, y: 100, width: 50, height: 50), CGRect(x: 50, y: 150, width: 50, height: 50)]
        context?.addRects(rects)
        context?.closePath()
        
        // 添加矩形的内切圆
        context?.addEllipse(in: CGRect(x: 50, y: 50, width: 150, height: 100))
        context?.closePath()
        
        context?.strokePath()
    }
    
    // 画子路径
    func drawSubPath() {
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addArc(tangent1End: CGPoint(x: 150, y: 150), tangent2End: CGPoint(x: 50, y: 150), radius: 50)
        path.closeSubpath()
        
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path)
        // 将图形上下文中的路径替换为路径的描边版本
        context?.replacePathWithStrokedPath()
        // 描边路径
        context?.strokePath()
    }
}


class MyQuartzView: UIView {
    // 在此方法中执行相关的绘制操作
    override func draw(_ rect: CGRect) {
        // 获取图形上下文的引用，当调用该方法时，UIKit已经为视图恰当地配置了绘图环境
        // 注意不能建立对图形上下文的强引用，因为它可能在调用draw方式时被更爱
        let context = UIGraphicsGetCurrentContext()
    }
}
