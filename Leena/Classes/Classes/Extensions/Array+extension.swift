//
//  Array+extension.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation

func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs == rhs
    case (.none, .none):
        return true
    default:
        return false
    }
}


public extension Array {
    func isExist() -> Bool {
        return !self.isEmpty
    }
    
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    ///   Checks if array contains at least 1 item which type is same with given element's type
    func containsType<T>(of element: T) -> Bool {
        let elementType = type(of: element)
        return contains { type(of: $0) == elementType}
    }
    
    ///   Decompose an array to a tuple with first element and the rest
    func decompose() -> (head: Iterator.Element, tail: SubSequence)? {
        return (count > 0) ? (self[0], self[1..<count]) : nil
    }
    
    ///   Iterates on each element of the array with its index. (Index, Element)
    func forEachEnumerated(_ body: @escaping (_ offset: Int, _ element: Element) -> Void) {
        enumerated().forEach(body)
    }
    
    func safeItem(at index: Int) -> Element? {
        guard (0..<self.count) ~= index else { return nil }
        return self[index]
    }
    
    ///   Gets the object at the specified index, if it exists.
    func get(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    ///   Prepends an object to the array.
    mutating func insertFirst(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    ///   Returns a random element from the array.
    func random() -> Element? {
        guard count > 0 else { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
    
    ///   Reverse the given index. i.g.: reverseIndex(2) would be 2 to the last
    func reverseIndex(_ index: Int) -> Int? {
        guard index >= 0 && index < count else { return nil }
        return Swift.max(count - 1 - index, 0)
    }
    
    ///   Shuffles the array in-place using the Fisher-Yates-Durstenfeld algorithm.
     mutating func shuffle() {
        guard count > 1 else { return }
        var j: Int
        for i in 0..<(count-2) {
            j = Int(arc4random_uniform(UInt32(count - i)))
            if i != i+j { self.swapAt(i, i+j) }
        }
    }
    
    ///   Shuffles copied array using the Fisher-Yates-Durstenfeld algorithm, returns shuffled array.
    func shuffled() -> Array {
        var result = self
        result.shuffle()
        return result
    }
    
    ///   Returns an array with the given number as the max number of elements.
    func takeMax(_ n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }
    
    ///   Checks if test returns true for all the elements in self
    func testAll(_ body: @escaping (Element) -> Bool) -> Bool {
        return !contains { !body($0) }
    }
    
    ///   Checks if all elements in the array are true or false
    func testAll(is condition: Bool) -> Bool {
        return testAll { ($0 as? Bool) ?? !condition == condition }
    }
}

public extension Array where Element: Equatable {
    
    ///   Checks if the main array contains the parameter array
    func contains(_ array: [Element]) -> Bool {
        return array.testAll { self.index(of: $0) ?? -1 >= 0 }
    }
    
    ///   Checks if self contains a list of items.
    func contains(_ elements: Element...) -> Bool {
        return elements.testAll { self.index(of: $0) ?? -1 >= 0 }
    }
    
    ///   Returns the indexes of the object
    func indexes(of element: Element) -> [Int] {
        return enumerated().compactMap { ($0.element == element) ? $0.offset : nil }
    }
    
    ///   Returns the last index of the object
    func lastIndex(of element: Element) -> Int? {
        return indexes(of: element).last
    }
    
    ///   Removes the first given object
    mutating func removeFirst(_ element: Element) {
        guard let index = index(of: element) else { return }
        self.remove(at: index)
    }
    
    
    mutating func removeAll(_ item: Element) -> [Element] {
        removeAll(where: { $0 == item })
        return self
    }
    
    mutating func removeDuplicates() -> [Element] {
        self = reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
        return self
    }
    
    func withoutDuplicates() -> [Element] {
        return reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
    
    ///   Removes all occurrences of the given object(s), at least one entry is needed.
    mutating func removeAll(_ firstElement: Element?, _ elements: Element...) {
        var removeAllArr = [Element]()
        
        if let firstElementVal = firstElement {
            removeAllArr.append(firstElementVal)
        }
        
        elements.forEach({element in removeAllArr.append(element)})
        
        removeAll(removeAllArr)
    }
    
    ///   Removes all occurrences of the given object(s)
    mutating func removeAll(_ elements: [Element]) {
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elements.contains($0) }
    }
    
    ///   Difference of self and the input arrays.
    func difference(_ values: [Element]...) -> [Element] {
        var result = [Element]()
        elements: for element in self {
            for value in values {
                //  if a value is in both self and one of the values arrays
                //  jump to the next iteration of the outer loop
                if value.contains(element) {
                    continue elements
                }
            }
            //  element it's only in self
            result.append(element)
        }
        return result
    }
    
    ///   Intersection of self and the input arrays.
    func intersection(_ values: [Element]...) -> Array {
        var result = self
        var intersection = Array()
        
        for (i, value) in values.enumerated() {
            //  the intersection is computed by intersecting a couple per loop:
            //  self n values[0], (self n values[0]) n values[1], ...
            if i > 0 {
                result = intersection
                intersection = Array()
            }
            
            //  find common elements and save them in first set
            //  to intersect in the next loop
            value.forEach { (item: Element) -> Void in
                if result.contains(item) {
                    intersection.append(item)
                }
            }
        }
        return intersection
    }
    
    ///   Union of self and the input arrays.
    func union(_ values: [Element]...) -> Array {
        var result = self
        for array in values {
            for value in array {
                if !result.contains(value) {
                    result.append(value)
                }
            }
        }
        return result
    }
    
    ///   Returns an array consisting of the unique elements in the array
    func unique() -> Array {
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
    
    func divided(by condition: (Element) throws -> Bool) rethrows -> (matching: [Element], nonMatching: [Element]) {
        var matching = [Element]()
        var nonMatching = [Element]()
        for element in self {
            try condition(element) ? matching.append(element) : nonMatching.append(element)
        }
        return (matching, nonMatching)
    }
    
    func sorted<T: Comparable>(by path: KeyPath<Element, T?>, ascending: Bool = true) -> [Element] {
        return sorted(by: { (lhs, rhs) -> Bool in
            guard let lhsValue = lhs[keyPath: path], let rhsValue = rhs[keyPath: path] else { return false }
            return ascending ? (lhsValue < rhsValue) : (lhsValue > rhsValue)
        })
    }
}

extension Array where Element: Hashable {
    
    ///   Removes all occurrences of the given object(s)
    mutating func removeAll(_ elements: [Element]) {
        let elementsSet = Set(elements)
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elementsSet.contains($0) }
    }
}

public extension Array where Element: NSObject {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.copy() as! Element)
        }
        return copiedArray
    }
}
