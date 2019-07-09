//
//  BinaryFloatingPoint+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

public extension BinaryFloatingPoint {
    func rounded(numberOfDecimalPlaces: Int, rule: FloatingPointRoundingRule) -> Self {
        let factor = Self(pow(10.0, Double(max(0, numberOfDecimalPlaces))))
        return (self * factor).rounded(rule) / factor
    }
}
