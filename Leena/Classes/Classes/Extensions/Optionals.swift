//
//  Optionals.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation
import UIKit

//MARK:- PROTOCOL
protocol OptionalType { init() }

//MARK:- EXTENSIONS
extension String: OptionalType {}
extension Int: OptionalType {}
extension CGFloat: OptionalType {}
extension Double: OptionalType {}
extension Bool: OptionalType {}
extension Float: OptionalType {}
extension CGRect: OptionalType {}
extension UIImage: OptionalType {}
extension IndexPath: OptionalType {}
extension Array : OptionalType {}
extension Date: OptionalType{}
extension UITableViewCell: OptionalType{}
extension UICollectionViewCell: OptionalType{}


prefix operator /

//unwrapping values
prefix func /<T: OptionalType>( value: T?) -> T {
    guard let validValue = value else { return T() }
    return validValue
}
