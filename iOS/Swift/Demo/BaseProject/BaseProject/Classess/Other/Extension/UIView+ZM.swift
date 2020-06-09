//
//  UIView+ZM.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

extension UIView: ZMCompatible {}

public extension ZM where Base: UIView {
    
    var x: CGFloat {
        get { base.frame.origin.x }
        set { base.frame.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { base.frame.origin.y }
        set { base.frame.origin.y = newValue }
    }
    
    var width: CGFloat {
        get { base.frame.size.width }
        set { base.frame.size.width = newValue }
    }
    
    var height: CGFloat {
        get { base.frame.size.height }
        set { base.frame.size.height = newValue }
    }
    
    var top: CGFloat {
        get { y }
        set { y = newValue }
    }
    
    var bottom: CGFloat {
        get { y + height }
        set { y = newValue - height }
    }
    
    
}
