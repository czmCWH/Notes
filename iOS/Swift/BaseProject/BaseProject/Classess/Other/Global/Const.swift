//
//  Const.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

public func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent) [\(line)], \(method):\(message)")
    #endif
}

let StatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

