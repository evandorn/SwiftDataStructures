//
//  Queue.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/23/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

class QueueNode<T> {
    
    var value: T? = nil
    var next: QueueNode? = nil
}