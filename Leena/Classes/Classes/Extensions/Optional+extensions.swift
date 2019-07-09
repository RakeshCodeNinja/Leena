//
//  Optional+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

public extension Optional {
    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
    
    func unwrapped(or error: Error) throws -> Wrapped {
        guard let wrapped = self else { throw error }
        return wrapped
    }
    
    func run(_ block: (Wrapped) -> Void) {
        _ = map(block)
    }

}

public extension Optional where Wrapped: Collection {

    var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
    
    var nonEmpty: Wrapped? {
        guard let collection = self else { return nil }
        guard !collection.isEmpty else { return nil }
        return collection
    }
    
}
