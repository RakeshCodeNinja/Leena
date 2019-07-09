//
//  LeenaPanGesture.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation
import UIKit

open class LeenaPanGesture: UIPanGestureRecognizer {
    private var panAction: ((UIPanGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        self.panAction = action
        self.addTarget(self, action: #selector(self.didPan(_:)))
    }
    
    @objc open func didPan (_ pan: UIPanGestureRecognizer) {
        panAction? (pan)
    }
}
