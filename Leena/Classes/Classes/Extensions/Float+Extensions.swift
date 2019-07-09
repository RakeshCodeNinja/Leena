//
//  Float+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

public extension Float {
    var int: Int {
        return Int(self)
    }
    
    /// SwifterSwift: Double.
    var double: Double {
        return Double(self)
    }
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
