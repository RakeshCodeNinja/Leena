//
//  Double+extension.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

func ** (lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

public extension Double {
    
   var toString: String { return String(self) }
    
   var toInt: Int { return Int(self) }
    
    var toCGFloat: CGFloat { return CGFloat(self) }
    
   var abs: Double {
        if self > 0 {
            return self
        } else {
            return -self
        }
    }
    
    var asNSNumber: NSNumber {
        return NSNumber(value: self)
    }
    
    func rounded(toPlaces places: Int) -> Double {
        guard places >= 0 else { return self }
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    
}
