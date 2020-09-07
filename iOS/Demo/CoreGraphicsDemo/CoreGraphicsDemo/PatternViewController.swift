//
//  PatternViewController.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/26.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class PatternViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "模式"
        view.backgroundColor = .gray
        edgesForExtendedLayout = [.left, .right]
        
        
        let pattern = PatternView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        pattern.backgroundColor = .white
        view.addSubview(pattern)
        
    }
    
}

class PatternView: UIView {
    override func draw(_ rect: CGRect) {
        
//        descPattern(rect)
        colorPattern(rect)
//        stencilPattern(rect)
        
    }
    
    // 绘制 Colored Patterns，注意此方式在ios12.0模拟器调试时，pattern cell的填充描边颜色均为灰色，其它方式调试正常
    func colorPattern(_ rect: CGRect) {
        // 1、在回调函数中绘制Colored Pattern Cell
        // 在绘制时需要设置 color，使其成为 colored pattern
        var callBacks = CGPatternCallbacks(version: 0, drawPattern: { (pointer, context) in

            context.setFillColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
            context.setStrokeColor(red: 0, green: 0, blue: 1.0, alpha: 1.0)
            context.setLineWidth(2.0)
            
            context.beginPath()
            context.addRect(.init(x: 10, y: 10, width: 20, height: 20));
            context.closePath()
            context.drawPath(using: .fillStroke)

        }) { (pointer) in
            print("释放资源")
        };
        
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()

        // 2、设置Colored Pattern 的颜色空间
        let patternSpace = CGColorSpace(patternBaseSpace: nil)
        context?.setFillColorSpace(patternSpace!)
        //context?.setStrokeColorSpace(patternSpace!)
        
        // 3、创建 Colored Pattern
        // 由于是 Colored Pattern，所以 isColored 必须为 true
        let pattern = CGPattern(info: nil, bounds: CGRect(x: 0, y: 0, width: 40, height: 40), matrix: CGAffineTransform.identity, xStep: 40, yStep: 40, tiling: CGPatternTiling.noDistortion, isColored: true, callbacks: &callBacks);
        
        // 4、为图形上下文设置fill pattern
        // 由于是 colored pattern，colorComponents需要传入一个alpha
        var alp: CGFloat = 1.0
        context?.setFillPattern(pattern!, colorComponents: &alp)
        
        // 5、填充图形上下文
        context?.fill(rect)
        context?.restoreGState()
    }
    
    // Stencil (Uncolored) Patterns(未着色模式)
    func stencilPattern(_ rect: CGRect) {
        
        // 1、在回调函数中绘制 Stencil pattern cell
        // 此回调函数与 colored pattern cell 绘制回调函数的唯一区别是，绘图回调中不指定任何颜色
        var callBacks = CGPatternCallbacks(version: 1, drawPattern: { (pointer, context) in
            
            let psize: CGFloat = 40
            let r = 0.8 * psize / 2;
            let theta = CGFloat.pi * 2 * (2.0 / 5.0)
            context.translateBy(x: psize / 2, y: psize / 2)
            
            context.beginPath()
            context.move(to: CGPoint(x: 0, y: r))
            for k in 0..<5 {
                context.addLine(to: CGPoint(x: r * sin(CGFloat(k) * theta), y: r * cos(CGFloat(k) * theta)))
            }
            
            context.closePath()
            context.fillPath()
        
        }) { (pointer) in
            print("释放资源")
        };
        
        // 2、创建 Stencil Pattern，注意：此时isColored必须传 false
        let pattern = CGPattern(info: nil, bounds: CGRect(x: 0, y: 0, width: 40, height: 40), matrix: CGAffineTransform.identity, xStep: 40, yStep: 40, tiling: CGPatternTiling.constantSpacing, isColored: false, callbacks: &callBacks);
        
        
        let context = UIGraphicsGetCurrentContext()
        
        // 3、设置 Stencil Pattern 的颜色空间，用于Stencil pattern cell的绘制
        let baseSpace = CGColorSpaceCreateDeviceRGB()
        let patternSpace = CGColorSpace(patternBaseSpace: baseSpace)
        context?.setFillColorSpace(patternSpace!)
        
        // 4、将 Stencil Pattern 进行描边 或者 填充
        // 由于 pattern cell 绘制回调函数中不提供颜色，因此此时必须传入颜色值。
        let colors:[CGFloat] = [246/255.0, 190/255.0, 73/255.0, 1]
        context?.setFillPattern(pattern!, colorComponents: colors)
        
        // 5、填充绘制到整个图形上下文的空间中
        context?.fill(rect)
    }
    
    // 参数详细解释
    func descPattern(_ rect: CGRect) {
        
        /* 在此回调函数中绘制 Colored Pattern Cell
         * pointer 是与 pattern 相关联的私有数据的通用指针
         * context 表示绘制图案单元的图形上下文
         */
        var callBacks = CGPatternCallbacks(version: 1, drawPattern: { (pointer, context) in
            
            context.addRect(.init(x: 10, y: 10, width: 20, height: 20));
            let cgColor = UIColor.blue.cgColor
            //            context.setStrokeColor(cgColor)
            //            context.strokePath()
            context.setFillColor(cgColor)
            context.fillPath()
            
            print(pointer?.load(as: Int.self) ?? 111)   // 打印两次分别输出：321 和 0
            
        }) { (pointer) in
            print("释放资源")
        };
        
        var arr = 321
        ///创建 pattern 对象
        /// - Parameters:
        ///   - info: 一个指针，指向 pattern 绘制函数中使用数据的私有存储的指针
        ///   - bounds: 在模式空间中指定pattern cell的边界框
        ///   - matrix: 一个CGAffineTransform矩阵，表示从模式空间到使用模式的上下文的默认用户空间的转换
        ///   - xStep: pattern cell 之间的水平间距。如果pattern cell之间水平间距为0，则此值应设置为 pattern cell的width
        ///   - yStep: pattern cell 之间的垂直间距。
        ///   - tiling: 一个 CGPatternTiling 常量，指定的平铺模式。
        ///   - isColored: 定模式单元格是着色模式(true)还是模板模式(false)
        ///   - callbacks: 指向模式回调函数表的指针，该函数由 CGPatternCallbacks 创建
        let pattern = CGPattern(info: &arr, bounds: rect, matrix: CGAffineTransform.identity, xStep: 40, yStep: 40, tiling: CGPatternTiling.constantSpacing, isColored: false, callbacks: &callBacks);
        
        
        let context = UIGraphicsGetCurrentContext()
        
        
        let paterColor = CGColorSpace(patternBaseSpace: CGColorSpace(name: CGColorSpace.sRGB)!);
        context?.setFillColorSpace(paterColor!);
        
        var alph: CGFloat = 1;
        context?.setFillPattern(pattern!, colorComponents: &alph);
        
        
        context?.beginPath()
        //        context?.addRect(CGRect(x: 50, y: 50, width: 100, height: 100))
        context?.addRect(rect)
        context?.fillPath();
        
        //        context?.beginPath()
        //        context?.addRect(CGRect(x: 50, y: 50, width: 100, height: 100))
        //        context?.setStrokeColor(UIColor.red.cgColor)
        //        context?.setLineWidth(2)
        //        context?.strokePath()
        
        // CGPatternTiling的三个值的作用：
        // (在绘制时pattern cell不会变形，其之间的间距可变化多达1设备像素)noDistortion
        // (单元间隔一致，pattern cell可能失真多达1设备像素)constantSpacingMinimalDistortion
        // (pattern cell的间距一致，和constantSpacingMinimalDistortion一样，pattern cell还可以被扭曲以允许更有效的实现)constantSpacing
    }
    
}
