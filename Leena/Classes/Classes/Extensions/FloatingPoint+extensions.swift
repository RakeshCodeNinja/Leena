//
//  FloatingPoint+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

extension FloatingPoint {

    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor *= 10 }
        return (self * divisor).rounded() / divisor
    }
    
    public mutating func round(toPlaces places: Int) {
        self = rounded(toPlaces: places)
    }
    
    public func ceiled(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor *= 10 }
        return (self * divisor).rounded(.up) / divisor
    }
    
    public mutating func ceil(toPlaces places: Int) {
        self = ceiled(toPlaces: places)
    }
    
    var abs: Self {
        return Swift.abs(self)
    }

    var isPositive: Bool {
        return self > 0
    }
    
    var isNegative: Bool {
        return self < 0
    }
    
}
