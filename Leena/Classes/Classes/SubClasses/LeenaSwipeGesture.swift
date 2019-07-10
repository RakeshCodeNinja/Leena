//
//  LeenaSwipeGesture.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation
import UIKit

open class LeenaSwipeGesture: UISwipeGestureRecognizer {
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        direction: UISwipeGestureRecognizer.Direction,
        fingerCount: Int = 1,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init()
        self.direction = direction
        numberOfTouchesRequired = fingerCount
        swipeAction = action
        addTarget(self, action: #selector(self.didSwipe(_:)))
    }
    
    @objc open func didSwipe (_ swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}
