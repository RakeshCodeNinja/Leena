//
//  UISegmentedControl+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit
public extension UISegmentedControl {
    var segmentTitles: [String] {
        get {
            let range = 0..<numberOfSegments
            return range.compactMap { titleForSegment(at: $0) }
        }
        set {
            removeAllSegments()
            for (index, title) in newValue.enumerated() {
                insertSegment(withTitle: title, at: index, animated: false)
            }
        }
    }
    
    var segmentImages: [UIImage] {
        get {
            let range = 0..<numberOfSegments
            return range.compactMap { imageForSegment(at: $0) }
        }
        set {
            removeAllSegments()
            for (index, image) in newValue.enumerated() {
                insertSegment(with: image, at: index, animated: false)
            }
        }
    }
    
    func setFont(_ font: UIFont) {
        self.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
}
#endif
