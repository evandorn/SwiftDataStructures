//
//  Node.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/22/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

class Node<T> {
    
    var value: T! = nil
    var next: Node? = nil
    var previous: Node? = nil
}