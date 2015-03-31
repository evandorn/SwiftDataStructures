//
//  Stack.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/30/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

class Stack<T> {
    
    private var top: Node<T>! = Node<T>()
    
    // TODO: add stack count
    
    // push an Object to the top of the stack
    func push(var value: T) {
        
        // check for an instance
        if(top == nil) {
            top = Node<T>()
        }
        
        // determine if the head node is populated
        if(top.value == nil) {
            top.value = value
            return
        } else {
            // Create the new item instance
            var childToUse: Node<T> = Node<T>()
            childToUse.value = value
            
            // Set newly created item at the top
            childToUse.next = top;
            top = childToUse;
        }
    }
    
    // Remove an object from the stack
    func pop() -> T? {
        
        // determine if the value or instance exists
        let topItem: T? = self.top?.value
        
        if(topItem == nil) {
            return nil
        }
        
        // retrieve and queue the next item
        var stackItem: T? = top.value!
        
        // get the top value
        if let nextItem = top.next {
            top = nextItem
        } else {
            top = nil
        }
        return stackItem
    }
    
    // Retrieve the object on top of the stack
    func peek() -> T? {
        
        // Determine if the value or instance exists
        if let topItem: T = self.top?.value {
            return topItem
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        
        // determine if the value or instance exists
        if let topItem: T = self.top?.value {
            return false
        } else {
            return true
        }
    }
    
    func count() -> Int {
        
        var stackCount: Int = 0
        
        // Determine if the value or instance exists
        let topItem: T? = self.top?.value
        
        if(topItem == nil) {
            return 0
        }
        
        // Initialize the current node as the first node on the stack (Top node)
        var current: Node = top
        
        // Start the count out at 1
        stackCount++
        
        // Loop through the list of items to get to the end
        while((current.next) != nil) {
            current = current.next!
            stackCount++
        }
        return stackCount
    }
}