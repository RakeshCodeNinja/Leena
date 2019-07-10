//
//  UISearchBar+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit

public extension UISearchBar {
    var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    
    func setupSearchBarTextField(_ closure: (UITextField) -> Void) {
        guard let textField = self.value(forKey: "searchField") as? UITextField else { return }
        closure(textField)
    }
    
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func clear() {
        text = ""
    }
}

#endif
