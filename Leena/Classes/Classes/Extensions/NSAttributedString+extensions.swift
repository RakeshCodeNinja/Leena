//
//  NSAttributedString+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

extension NSAttributedString {
    public func bold() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)], range: range)
        return copy
    }
    
    public func underline() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue], range: range)
        return copy
    }
    
    public func italic() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)], range: range)
        return copy
    }
    
    public func strikethrough() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        let attributes = [
            NSAttributedStringKey.strikethroughStyle: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)]
        copy.addAttributes(attributes, range: range)
        
        return copy
    }
    
    public func color(_ color: UIColor) -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        return copy
    }
    
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }
    
    static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }
    
    static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }
    
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }

}
