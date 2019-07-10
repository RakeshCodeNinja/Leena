//
//  Calender+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(Foundation)
import Foundation

public extension Calendar {
    func numberOfDaysInMonth(for date: Date) -> Int {
        return range(of: .day, in: .month, for: date)!.count
    }
    
        
    static var persian: Calendar { return Calendar(identifier: .persian) }
        
    
    
}

#endif
