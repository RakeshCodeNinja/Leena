//
//  UIDevice+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import UIKit

extension UIDevice {
    @available(iOS 11.0, *)
    static var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
#endif
