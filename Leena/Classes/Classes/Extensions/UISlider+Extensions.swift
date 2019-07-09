//
//  UISlider+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import Foundation

public extension UISlider {
    
    func setValue(_ value: Float, animated: Bool = true, duration: TimeInterval = 1, completion: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: duration, animations: {
                self.setValue(value, animated: true)
            }, completion: { _ in
                completion?()
            })
        } else {
            setValue(value, animated: false)
            completion?()
        }
    }
    
    func setValue(_ value: Float, duration: Double) {
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.setValue(self.value, animated: true)
        }, completion: { (_) -> Void in
            UIView.animate(withDuration: duration, animations: { () -> Void in
                self.setValue(value, animated: true)
            }, completion: nil)
        })
    }
    
}
#endif
