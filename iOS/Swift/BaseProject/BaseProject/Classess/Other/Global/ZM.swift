//
//  ZM.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

public struct ZM<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol ZMCompatible {}

public extension ZMCompatible {
    static var zm: ZM<Self>.Type {
        get { ZM<Self>.self }
        set {}
    }
    var zm: ZM<Self> {
        get { ZM(self) }
        set {}
    }
}
