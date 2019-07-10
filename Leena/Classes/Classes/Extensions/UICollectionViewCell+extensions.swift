//
//  UICollectionViewCell+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
#endif
