//
//  Queue.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/23/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

public class Queue<T> {
    
    private var front: QueueNode<T>! = QueueNode<T>()
    
    // number of items in the Queue
    var count: Int {
        // empty queue case
        if(front.value == nil) {
            return 0
        } else {
            // set the first item in the queue to the front and initialize the count to 1
            var current: QueueNode<T> = front
            var queueCount: Int = 1
            
            // Cycle through the list of items
            while(current.next != nil) {
                current = current.next!
                queueCount++
            }
            return queueCount
        }
    }
    
    // Add the item to the queue
    func enqueue(value: T) {
        
        // Check if the queue exists first
        if(front == nil) {
            front = QueueNode<T>()
        }
        
        // Set the first element in the queue
        if(front.value == nil) {
            front.value = value
            return
        }
        
        var nodeToUse: QueueNode<T> = QueueNode<T>()
        var current: QueueNode = front
        
        // Iterate through the queue until the end
        while(current.next != nil) {
            current = current.next!
        }
        
        // Add a new item to the queue
        nodeToUse.value = value
        current.next = nodeToUse
    }
    
    // Check the first item in the queue
    func peek() -> T? {
        return front.value!
    }
    
    // Get items, starting from the front in O(1) time
    func dequeue() -> T? {
        
        // Determine if the value or instance exists first
        let frontItem: T? = self.front?.value
        
        if(frontItem == nil) {
            return nil
        }
        
        // retrieve the value and queue the next item
        var queueItem: T? = front.value!
        
        // Use optional binding
        if let nextValue = front.next {
            front = nextValue
        } else {
            front = nil
        }
        return queueItem
    }
    
    // Check to see if the queue is empty or not
    func isEmpty() -> Bool {
        
        if let frontItem: T = self.front?.value {
            return false
        } else {
            return true
        }
    }
}