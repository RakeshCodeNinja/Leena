
//
//  SignedNumber.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

public extension SignedNumeric {
    
    #if canImport(Foundation)
    func spelledOutString(locale: Locale = .current) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .spellOut
        
        guard let number = self as? NSNumber else { return nil }
        return formatter.string(from: number)
    }
    #endif
    
}
