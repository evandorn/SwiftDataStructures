//
//  LinkedList.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/22/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

public class LinkedList<T: Equatable> {
    
    // Create a new Node instance
    private var head: Node<T> = Node<T>()
    
    // The number of items in the list
    var count: Int {
        // empty list case
        if(head.value == nil) {
            return 0
        } else {
            var current: Node = head
            var listCount: Int = 1
            
            // iterate through the list and count the items
            while((current.next) != nil) {
                current = current.next!
                listCount++
            }
            return listCount
        }
    }
    
    // Add a new item to the list
    func addNode(value: T) {
        
        // set the head node first
        if(head.value == nil) {
            head.value = value
            return;
        }
        
        // iteration variables
        var current: Node? = head
        
        while(current != nil) {
            if(current?.next == nil) {
                var nodeToUse: Node = Node<T>()
                
                nodeToUse.value = value
                nodeToUse.previous = current
                current!.next = nodeToUse
                break
            } else {
                current = current?.next
            }
        }
    }
    
    // Print out all the values in the list
    func printList() {
        var current: Node! = head
        
        println("------------------")
        
        // assign the next instance
        while(current != nil) {
            println("Value of item in list is: \(current.value)")
        }
    }
    
    // Remove a node at a specified index
    func removeNodeAtIndex(index: Int) {
        
        var current: Node<T>?
        var trailingPtr: Node<T>?
        var listIndex: Int = 0
        
        // Check if you are removing the head node first
        if(index == 0) {
            current = current?.next
            head = current!
            return
        }
        
        while(current != nil) {
            if(listIndex == index) {
                // redirect the trailing pointer and next pointer
                trailingPtr!.next = current?.next
                current = nil
                break
            }
            
            // Update the assignments
            trailingPtr = current
            current = current?.next
            listIndex++
        }
    }
    
    // Add a node at a spcified index
    func addNodeAtIndex(value: T, index: Int) {
        
        // move the head node 
        if(head.value == nil) {
            head.value = value
            return
        }
        
        // reset the trailing pointer, current, and next items
        var current: Node<T>? = head
        var trailingPtr: Node<T>? = nil
        var listIndex: Int = 0
        
        // Move through the list until you find the insertion index
        while(current != nil) {
            if(listIndex == index) {
                var nodeToUse: Node = Node<T>()
                
                // create a new node
                nodeToUse.value = value
                
                // connect the node in front of the current node
                nodeToUse.next = current
                nodeToUse.previous = trailingPtr
                
                // use optional binding when using the trailing pointer
                if let addTrailingPtr = trailingPtr {
                    addTrailingPtr.next = nodeToUse
                    nodeToUse.previous = addTrailingPtr
                }
                
                // point the new node to the current / previous node
                current!.previous = nodeToUse
                
                // replace the head node if needed
                if(index == 0) {
                    head = nodeToUse
                }
                break
            }
            
            // iterate through the list to the next item
            trailingPtr = current
            current = current?.next
            listIndex += 1
        }
    }
}