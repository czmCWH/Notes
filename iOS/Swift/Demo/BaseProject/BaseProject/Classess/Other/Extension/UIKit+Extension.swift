//
//  UIKit+Extension.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

extension Int {
    func power(n: Double) -> Int {
        return Int(pow(Double(self), n))
    }
    public var float: Float {
        return Float(self)
    }
    public var double: Double {
        return Double(self)
    }
    public var string: String {
        return String(self)
    }
}

extension Float {
    func power(n: Float) -> Float {
        return powf(self, n)
    }
    public var int: Int {
        return Int(self)
    }
    public var double: Double {
        return Double(self)
    }
    public var string: String {
        return String(self)
    }
    public var int_ceil: Int {
        return Int(ceil(self))
    }
    public var int_round: Int {
        return Int(roundf(self))
    }
    public var int_floor: Int {
        return Int(floor(self))
    }
}

extension Double {
    func power(n: Double) -> Double {
        return pow(self, n)
    }
    public var int: Int {
        return Int(self)
    }
    public var string: String {
        return String(self)
    }
    public var int_ceil: Int {
        return Int(ceil(self))
    }
    public var int_round: Int {
        return Int(roundf(Float(self)))
    }
    public var int_floor: Int {
        return Int(floor(self))
    }
}

extension String {
    public var int: Int {
        let d = Double(self)
        let i = Int(d ?? 0)
        return i
    }
    public var uint: UInt {
        let ui = Double(self)
        let u = UInt(ui ?? 0)
        return u
    }
    public var float: Float {
        let d = Double(self)
        let f = Float(d ?? 0.0)
        return f
    }
    public var double: Double {
        let d = Double(self)
        return d ?? 0.0
    }
}

extension NSObject {
    
    var classNameAsString: String{
//        return NSStringFromClass(self.classForCoder).componentsSeparatedByString(".").last!
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

func stringFromClass(cls: AnyClass)->String?{
//    let string = NSStringFromClass(cls.self).componentsSeparatedByString(".").last
    let string = NSStringFromClass(cls.self).components(separatedBy: ".").last
    
    return string
}
