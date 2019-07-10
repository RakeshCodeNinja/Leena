//
//  Date+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

public extension Date {
    enum DayNameStyle {
        case threeLetters
        case oneLetter
        case full
        
    }
    
    enum MonthNameStyle {
        case threeLetters
        case oneLetter
        case full
    }
    
    var calendar: Calendar {
        return Calendar(identifier: Calendar.current.identifier)
    }
    
    var isInFuture: Bool {
        return self > Date()
    }
    
    var isInPast: Bool {
        return self < Date()
    }
    
    var isInToday: Bool {
        return calendar.isDateInToday(self)
    }
    
    var isInYesterday: Bool {
        return calendar.isDateInYesterday(self)
    }
    
    var isInTomorrow: Bool {
        return calendar.isDateInTomorrow(self)
    }
    
    var isInWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }
    
    var isWorkday: Bool {
        return !calendar.isDateInWeekend(self)
    }
    
    var isInCurrentWeek: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    var isInCurrentMonth: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    
    var isInCurrentYear: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }
    
    var yesterday: Date {
        return calendar.date(byAdding: .day, value: -1, to: self) ?? Date()
    }
    
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func dateString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    func dateTimeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    func timeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
    }
    
    func adding(_ component: Calendar.Component, value: Int) -> Date {
        return calendar.date(byAdding: component, value: value, to: self)!
    }
    
    mutating func add(_ component: Calendar.Component, value: Int) {
        if let date = calendar.date(byAdding: component, value: value, to: self) {
            self = date
        }
    }
    
    func monthName(ofStyle style: MonthNameStyle = .full) -> String {
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "MMMMM"
            case .threeLetters:
                return "MMM"
            case .full:
                return "MMMM"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self)
    }
    
    func dayName(ofStyle style: DayNameStyle = .full) -> String {
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "EEEEE"
            case .threeLetters:
                return "EEE"
            case .full:
                return "EEEE"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self)
    }
    
    func changing(_ component: Calendar.Component, value: Int) -> Date? {
        switch component {
        case .nanosecond:
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentNanoseconds = calendar.component(.nanosecond, from: self)
            let nanosecondsToAdd = value - currentNanoseconds
            return calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self)
            
        case .second:
            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentSeconds = calendar.component(.second, from: self)
            let secondsToAdd = value - currentSeconds
            return calendar.date(byAdding: .second, value: secondsToAdd, to: self)
            
        case .minute:
            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMinutes = calendar.component(.minute, from: self)
            let minutesToAdd = value - currentMinutes
            return calendar.date(byAdding: .minute, value: minutesToAdd, to: self)
            
        case .hour:
            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentHour = calendar.component(.hour, from: self)
            let hoursToAdd = value - currentHour
            return calendar.date(byAdding: .hour, value: hoursToAdd, to: self)
            
        case .day:
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = value - currentDay
            return calendar.date(byAdding: .day, value: daysToAdd, to: self)
            
        case .month:
            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = value - currentMonth
            return calendar.date(byAdding: .month, value: monthsToAdd, to: self)
            
        case .year:
            guard value > 0 else { return nil }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = value - currentYear
            return calendar.date(byAdding: .year, value: yearsToAdd, to: self)
            
        default:
            return calendar.date(bySetting: component, value: value, of: self)
        }
    }
    
    var tomorrow: Date {
        return calendar.date(byAdding: .day, value: 1, to: self) ?? Date()
    }
    
    var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentHour = calendar.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour
            if let date = calendar.date(byAdding: .hour, value: hoursToAdd, to: self) {
                self = date
            }
        }
    }
    
    var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self)
    }
    
    var weekday: Int {
        return calendar.component(.weekday, from: self)
    }
    
    var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self)
    }
    
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            guard newValue > 0 else { return }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = newValue - currentYear
            if let date = calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
                self = date
            }
        }
    }
    
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = newValue - currentMonth
            if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
                self = date
            }
        }
    }
    
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = newValue - currentDay
            if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
                self = date
            }
        }
    }
    
    var millisecond: Int {
        get {
            return calendar.component(.nanosecond, from: self) / 1000000
        }
        set {
            let nanoSeconds = newValue * 1000000
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(nanoSeconds) else { return }
            
            if let date = calendar.date(bySetting: .nanosecond, value: nanoSeconds, of: self) {
                self = date
            }
        }
    }
    
    var nanosecond: Int {
        get {
            return calendar.component(.nanosecond, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentNanoseconds = calendar.component(.nanosecond, from: self)
            let nanosecondsToAdd = newValue - currentNanoseconds
            
            if let date = calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self) {
                self = date
            }
        }
    }
    
    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {
        if includeBounds {
            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
        }
        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
    }
    
    func secondsSince(_ date: Date) -> Double {
        return timeIntervalSince(date)
    }
    
    func minutesSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/60
    }
    
    func hoursSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/3600
    }
    
    func daysSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/(3600*24)
    }
    
    func timePassed() -> String {
        let date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
        var str: String
        if components.year! >= 1 {
            components.year == 1 ? (str = "year") : (str = "years")
            return "\(components.year!) \(str) ago"
        } else if components.month! >= 1 {
            components.month == 1 ? (str = "month") : (str = "months")
            return "\(components.month!) \(str) ago"
        } else if components.day! >= 1 {
            components.day == 1 ? (str = "day") : (str = "days")
            return "\(components.day!) \(str) ago"
        } else if components.hour! >= 1 {
            components.hour == 1 ? (str = "hour") : (str = "hours")
            return "\(components.hour!) \(str) ago"
        } else if components.minute! >= 1 {
            components.minute == 1 ? (str = "minute") : (str = "minutes")
            return "\(components.minute!) \(str) ago"
        } else if components.second! >= 1 {
            components.second == 1 ? (str = "second") : (str = "seconds")
            return "\(components.second!) \(str) ago"
        } else {
            return "Just now"
        }
    }
    
     func timePassed() -> LeenaTimePassed {
        
        let date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
        
        if components.year! >= 1 {
            return LeenaTimePassed.year(components.year!)
        } else if components.month! >= 1 {
            return LeenaTimePassed.month(components.month!)
        } else if components.day! >= 1 {
            return LeenaTimePassed.day(components.day!)
        } else if components.hour! >= 1 {
            return LeenaTimePassed.hour(components.hour!)
        } else if components.minute! >= 1 {
            return LeenaTimePassed.minute(components.minute!)
        } else if components.second! >= 1 {
            return LeenaTimePassed.second(components.second!)
        } else {
            return LeenaTimePassed.now
        }
    }
}
