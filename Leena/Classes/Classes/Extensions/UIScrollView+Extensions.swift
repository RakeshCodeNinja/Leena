//
//  UIScrollView+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit

public extension UIScrollView {
    var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(contentSize, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        let previousFrame = frame
        frame = CGRect(origin: frame.origin, size: contentSize)
        layer.render(in: context)
        frame = previousFrame
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}

#endif
