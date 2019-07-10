//
//  CAShapeLayer+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import UIKit

extension CAShapeLayer {
    
    func drawRoundedRect(
        rect: CGRect,
        fillColor _fillColor: UIColor?    = nil,
        strokeColor _strokeColor: UIColor?    = nil,
        cornerRadius _cornerRadius: CGFloat?    = nil
        ) {
        fillColor = _fillColor?.cgColor
        strokeColor = _strokeColor?.cgColor
        path = UIBezierPath(roundedRect: rect, cornerRadius: _cornerRadius ?? (rect.height / 2)).cgPath
    }
    
}

#endif
