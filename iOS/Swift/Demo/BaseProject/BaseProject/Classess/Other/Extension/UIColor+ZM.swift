//
//  UIColor+ZM.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

extension UIColor: ZMCompatible {}

public extension ZM where Base: UIColor {
    
    static func initHex(_ hex: UInt, alpha: Float = 1.0) -> Base {
        Base.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(hex & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
        )
    }
    
    static func initHex(_ hexString: String, alpha: Float = 1.0) -> Base {
        let hex: UInt = hexString.uint
        return Base.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(hex & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
        )
    }
    
    func toImage() -> UIImage{
        
        let size = CGSize(width: 1, height: 1)
        
        UIGraphicsBeginImageContext(size)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(base.cgColor)
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        context?.fill(rect)
        
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return theImage!
    }
}

