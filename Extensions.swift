//
//  Extensions.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/30/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

extension String {
    
    // Compute the length of a string
    var length: Int {
        return Array(self).count
    }
    
    // Returns characters of a string up to a specified index
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(advance(self.startIndex, to))
    }
    
    // Returns a character at a specific index
    func characterAtIndex(position: Int) -> String {
        return String(Array(self)[position])
    }
}

extension Int {
    
    func times(closure:(Int) -> Void) {
        for i in 0...self {
        closure(i)
    }
  }
}
