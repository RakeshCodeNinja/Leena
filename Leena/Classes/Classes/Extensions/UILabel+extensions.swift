//
//  UILabel+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if os(iOS) || os(tvOS)

import UIKit

public extension UILabel {
    func getEstimatedSize(_ width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: self.width, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.height)).width
    }
    
    var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        return label.frame.height
    }

    
    func fitHeight() {
        self.height = getEstimatedHeight()
    }
    
    func fitWidth() {
        self.width = getEstimatedWidth()
    }
    
    func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
    
    func set(text _text: String?, duration: TimeInterval) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: { () -> Void in
            self.text = _text
        }, completion: nil)
    }
}
#endif
