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
import SwiftyJSON

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

infix operator =>
infix operator =|
infix operator =<

typealias OptionalJSON = [String : JSON]?

func =>(key : String, json : OptionalJSON) -> String?{
    return json?[key]?.stringValue
}

func =<(key : String, json : OptionalJSON) -> [String : JSON]?{
    return json?[key]?.dictionaryValue
}

func =|(key : String, json : OptionalJSON) -> [JSON]?{
    return json?[key]?.arrayValue
}
