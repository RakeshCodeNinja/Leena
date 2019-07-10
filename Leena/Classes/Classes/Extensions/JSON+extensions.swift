//
//  JSON+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import SwiftyJSON

extension JSON {
    
    var intFromIntOrString: Int? {
        return self.int ?? Int(self.string ?? "//")
    }
    
    var doubleFromDoubleOrString: Double? {
        return self.double ?? Double(self.string ?? "//")
    }
    
    var booleanFromBoolOrIntOrString: Bool? {
        if let boolValue    = self.bool { return boolValue }
        if let intValue = self.int { return intValue == 1 }
        if let stringValue    = self.string { return stringValue == "1" }
        return nil
    }
    
    var dateBasedOnMilisecond: Date? {
        guard
            let timeInterval_String = self.string,
            let timeInterval_Int64 = Int64(timeInterval_String)
            else { return nil }
        return Date(timeIntervalSince1970: TimeInterval(timeInterval_Int64 / 1_000))
        
    }
    
    var dateBasedOnSecond: Date? {
        if    let timeInterval_String = self.string,
            let timeInterval_Double = Double(timeInterval_String) {
            return Date(timeIntervalSince1970: timeInterval_Double)
        }
        if    let timeInterval_Double = self.double {
            return Date(timeIntervalSince1970: timeInterval_Double)
        }
        return nil
    }
    
    var stringWithPersianDigits: String? {
        return self.string?.lph.withPersianDigits
    }
    
    func dateFromString(basedOn dateFormatter: DateFormatter) -> Date? {
        guard let string = self.string else { return nil }
        return dateFormatter.date(from: string)
    }
    
}

#endif
