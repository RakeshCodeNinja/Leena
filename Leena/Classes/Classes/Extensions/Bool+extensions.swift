//
//  Bool+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if os(iOS)
import Foundation

public extension Bool {
    var int: Int {
        return self ? 1 : 0
    }
    
    var string: String {
        return self ? "true" : "false"
    }
    
    mutating func toggle() {
        self = !self
    }
    
    var inverted: Bool {
        return !self
    }
    
    func ifIsTrue(_ block: () -> Void) {
        guard self else { return }
        block()
    }
    
    func checkAndPerform(ifTrue closure_True: @autoclosure () -> Void, ifFalse closure_False: @autoclosure () -> Void) {
        if self { closure_True() } else { closure_False() }
    }
}

#endif
