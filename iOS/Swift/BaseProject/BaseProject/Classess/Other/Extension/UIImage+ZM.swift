//
//  UIImage+ZM.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

extension UIImage: ZMCompatible {}

public extension ZM where Base: UIImage {
    
    var original: Base {
        base.withRenderingMode(.alwaysOriginal) as! Base
    }
    
}
