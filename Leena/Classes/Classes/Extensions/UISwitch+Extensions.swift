//
//  UISwitch+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit

public extension UISwitch {
    func toggle(animated: Bool = true) {
        setOn(!isOn, animated: animated)
    }
    
}

#endif

