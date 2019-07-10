//
//  DateFormatter+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if canImport(UIKit)
import Foundation
extension DateFormatter {
    
    static var basedOnPersianLanguage: DateFormatter {
        return initialize(calendar: .persian, locale: .farsi, dateFormat: "yyyy/MM/dd HH:mm")
    }
    
    static func initialize(calendar: Calendar = .persian, locale: Locale = .farsi, dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.locale = locale
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }
    
}

#endif
