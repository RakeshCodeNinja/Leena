//
//  Int+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

func ** (lhs: Int, rhs: Int) -> Double {
    return pow(Double(lhs), Double(rhs))
}

public extension Int {
    func isPrime() -> Bool {
        
        if self == 2 { return true }
        
        guard self > 1 && self % 2 != 0 else { return false }
    
        let base = Int(sqrt(Double(self)))
        for int in Swift.stride(from: 3, through: base, by: 2) where self % int == 0 {
            return false
        }
        return true
    }
    
    func romanNumeral() -> String? {
        guard self > 0 else {
            return nil
        }
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var romanValue = ""
        var startingValue = self
        
        for (index, romanChar) in romanValues.enumerated() {
            let arabicValue = arabicValues[index]
            let div = startingValue / arabicValue
            if div > 0 {
                for _ in 0..<div {
                    romanValue += romanChar
                }
                startingValue -= arabicValue * div
            }
        }
        return romanValue
    }
    
    func roundToNearest(_ number: Int) -> Int {
        return number == 0 ? self : Int(round(Double(self) / Double(number))) * number
    }
}

extension Int {
    // Checks if the integer is even.
    public var isEven: Bool { return (self % 2 == 0) }
    
    // Checks if the integer is odd.
    public var isOdd: Bool { return (self % 2 != 0) }
    
    // Checks if the integer is positive.
    public var isPositive: Bool { return (self > 0) }
    
    // Checks if the integer is negative.
    public var isNegative: Bool { return (self < 0) }
    
    // Converts integer value to Double.
    public var toDouble: Double { return Double(self) }
    
    // Converts integer value to Float.
    public var toFloat: Float { return Float(self) }
    
    // Converts integer value to CGFloat.
    public var toCGFloat: CGFloat { return CGFloat(self) }
    
    // Converts integer value to String.
    public var toString: String { return String(self) }
    
    // Converts integer value to UInt.
    public var toUInt: UInt { return UInt(self) }
    
    // Converts integer value to Int32.
    public var toInt32: Int32 { return Int32(self) }
    
    // Converts integer value to a 0..<Int range. Useful in for loops.
    public var range: CountableRange<Int> { return 0..<self }
    
    // Returns number of digits in the integer.
    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } 
    }

    public var digitArray: [Int] {
        var digits = [Int]()
        for char in self.toString {
            if let digit = Int(String(char)) {
                digits.append(digit)
            }
        }
        return digits
    }
    
    // Returns a random integer number in the range min...max, inclusive.
    public static func random(within: Range<Int>) -> Int {
        let delta = within.upperBound - within.lowerBound
        return within.lowerBound + Int(arc4random_uniform(UInt32(delta)))
    }
}
