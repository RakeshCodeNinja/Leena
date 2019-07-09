//
//  NSObject+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}
