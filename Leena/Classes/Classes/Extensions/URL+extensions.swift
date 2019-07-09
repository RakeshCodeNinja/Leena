//
//  URL+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(Foundation)
import Foundation

public extension URL {
    
    var fileCreationDate: Date? {
        get {
            var datecreatev: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&datecreatev, forKey: URLResourceKey.creationDateKey)
            } catch _ {
            }
            return datecreatev as? Date
        }
        set {
            do {
                try (self as NSURL).setResourceValue(newValue, forKey: URLResourceKey.creationDateKey)
            } catch _ {
            }
            
        }
    }
    
    var fileIsHidden: Bool {
        get {
            var ishiddenv: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&ishiddenv, forKey: URLResourceKey.isHiddenKey)
            } catch _ {
            }
            return ishiddenv?.boolValue ?? false
        }
        set {
            do {
                try (self as NSURL).setResourceValue(newValue, forKey: URLResourceKey.isHiddenKey)
            } catch _ {
            }
            
        }
    }
    
    var fileSize: Int64 {
        var sizev: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&sizev, forKey: URLResourceKey.fileSizeKey)
        } catch _ {
        }
        return sizev?.int64Value ?? -1
    }
    
    var fileAccessDate: Date? {
        _ = URLResourceKey.customIconKey
        var dateaccessv: AnyObject?
        do {
            try (self as NSURL).getResourceValue(&dateaccessv, forKey: URLResourceKey.contentAccessDateKey)
        } catch _ {
        }
        return dateaccessv as? Date
    }
    
    var fileModifiedDate: Date? {
        get {
            var datemodv: AnyObject?
            do {
                try (self as NSURL).getResourceValue(&datemodv, forKey: URLResourceKey.contentModificationDateKey)
            } catch _ {
            }
            return datemodv as? Date
        }
        set {
            do {
                try (self as NSURL).setResourceValue(newValue, forKey: URLResourceKey.contentModificationDateKey)
            } catch _ {
            }
        }
    }

    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false), let queryItems = components.queryItems else { return nil }
        
        var items: [String: String] = [:]
        
        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }
        
        return items
    }
    
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }
    
    mutating func appendQueryParameters(_ parameters: [String: String]) {
        self = appendingQueryParameters(parameters)
    }
    
    func deletingAllPathComponents() -> URL {
        var url: URL = self
        for _ in 0..<pathComponents.count - 1 {
            url.deleteLastPathComponent()
        }
        return url
    }
    
    mutating func deleteAllPathComponents() {
        for _ in 0..<pathComponents.count - 1 {
            deleteLastPathComponent()
        }
    }
    
}


#endif
