//
//  Character+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

extension Character {
    public var toString: String { return String(self) }
    
    public var toInt: Int? { return Int(String(self)) }
    
    public var lowercased: Character {
        let s = String(self).lowercased()
        return s[s.startIndex]
    }
    
    public var uppercased: Character {
        let s = String(self).uppercased()
        return s[s.startIndex]
    }

    var isEmoji: Bool {
        return String(self).includesEmoji()
    }
    
    static func randomAlphanumeric() -> Character {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
    }
}
