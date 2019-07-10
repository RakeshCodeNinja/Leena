//
//  CGPoint+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)

import UIKit
import Foundation

extension CGPoint {
    
    public init(vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    public init(angle: CGFloat) {
        self.init(x: cos(angle), y: sin(angle))
    }
    
    public static func + (this: CGPoint, that: CGPoint) -> CGPoint {
        return CGPoint(x: this.x + that.x, y: this.y + that.y)
    }
    
    public static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    public static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    public static func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(pow(to.x - from.x, 2) + pow(to.y - from.y, 2))
    }
    
    public func normalized() -> CGPoint {
        let len = CGPoint.distance(from: self, to: CGPoint.zero)
        return CGPoint(x: self.x / len, y: self.y / len)
    }
    
    public var angle: CGFloat {
        return atan2(y, x)
    }
    
    public static func dotProduct(this: CGPoint, that: CGPoint) -> CGFloat {
        return this.x * that.x + this.y * that.y
    }
    
    public static func linearInterpolation(startPoint: CGPoint, endPoint: CGPoint, interpolationParam: CGFloat) -> CGPoint {
        return startPoint + (endPoint - startPoint) * interpolationParam
    }
}

#endif

