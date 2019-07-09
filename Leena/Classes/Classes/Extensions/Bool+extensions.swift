//
//  Bool+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

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
}
