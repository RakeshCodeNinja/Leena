//
//  Collection+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

#if canImport(Dispatch)
import Dispatch
#endif

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

public extension Collection where Element == IntegerLiteralType, Index == Int {
    func average() -> Double {
        return isEmpty ? 0 : Double(reduce(0, +)) / Double(count)
    }
    
}

public extension Collection where Element: FloatingPoint {
    func average() -> Element {
        guard !isEmpty else { return 0 }
        return reduce(0, {$0 + $1}) / Element(count)
    }
    
}
