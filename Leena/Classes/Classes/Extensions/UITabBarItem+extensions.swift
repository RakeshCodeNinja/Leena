//
//  UITabBarItem+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import UIKit
extension UITabBarItem {
    
    static func setTitleTextAttributes(_ attributes: [NSAttributedString.Key: Any], for state: UIControl.State = UIControl.State()) {
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: state)
    }
    
    static func setupAppearance(font: UIFont, textColor: UIColor, for state: UIControl.State) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor
        ]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: state)
    }
    
}

#endif
