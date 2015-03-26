//
//  SearchingSorting.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/23/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

public class SearchingSorting {
    
    var isValueFound: Bool = false
    
    
    /*
     *  binary search algorthim. Find the value at the middle index.
     *  note the use of the tuple to organize the upper and lower search bounds.
     */
    
    func binarySearch(var numberList: Array<Int>, value: Int, range:(min: Int, max: Int)) {
        var midIndex: Double = round(Double((range.min + range.max) / 2))
        var midNumber = numberList[Int(midIndex)]
        
        // Use recursion to increase the possible range for the search
        if(midNumber > value) {
            binarySearch(numberList, value: value, range: (range.min, Int(midIndex) - 1))
        }
        // Again, use recursion to increase the possbile range for the search
        else if(midNumber < value) {
            binarySearch(numberList, value: value, range: (Int(midIndex) + 1, range.max))
        } else {
            isValueFound = true
            println("value \(value) found..")
        }
    }
    
    /*
     * insertion sort algorithm - rank set of random numbers lowest to highest by
     * inserting numbers based on a sorted and unsorted side.
     */
    
    func insertionSort(var numberList: Array<Int>) -> Array<Int> {
        
        var i, j, value: Int
        
        for(i = 0; i < numberList.count; i++) {
            // Get the value to be evaluated
            value = numberList[i]
            
            // iterate backwards through the sorted portion of the array
            for(j = i; j > -1; j--) {
                println("comparing \(value) and \(numberList[j])")
                
                    if(value < numberList[j]) {
                    // remove item from the original position in the array
                    numberList.removeAtIndex(j + 1)
                    
                    // insert number at the value's position
                    numberList.insert(value, atIndex: j)
                }
            }
        }
        return numberList
    }
    
    /*
     *  bubble sort algorithm - rank items from the lowest to highest by swapping
     *  groups of two items from left to right. The highest item in the set will bubble up to the
     *  right side of the set after the first iteration.
     */
    
    func bubbleSort(var numberList: Array<Int>) -> Array<Int> {
        
        var i, j, k, numIterations, value: Int
        
        for(i = 0; i < numberList.count; ++i) {
            
            // Outer loop is maintained to track how many iterations to pass through the list
            numIterations = (numberList.count - 1) - i
            
            for(j = 0; j < numIterations; j++) {
                // Get the value to sort
                value = numberList[j]
                
                println("Comparing \(value) and \(numberList[j + 1])")
                
                if(value > numberList[j + 1]) {
                    // Pull out the value to be swapped
                    k = numberList[j + 1]
                    
                    // write the value where the previous value was placed
                    numberList[j + 1] = value
                    
                    // place the pulled value in the previous position
                    numberList[j] = k
                }
            }
        }
        return numberList
    }
    
    /*
     *  Quick sort works by dividing and conquering
     *  Firstly it picks a pivot point then looks at all items in the observed array
     *  and moves values to the left or right of the pivot based on their value
     *  it works recursively so that either side will be eventually sorted back to the top
     */
    func quickSort(var loops:[Int]) -> [Int] {
    
        if(loops.count <= 1) {
            return loops
        }
        
        var pivot = loops.removeAtIndex(0)
        var leftSide:[Int] = []
        var rightSide:[Int] = []
        
        (loops.count - 1).times { i in
            if (loops[i] <= pivot) {
                leftSide.append(loops[i])
            } else {
             rightSide.append(loops[i])
            }
        }
        
        var mergedArray:[Int] = []
        mergedArray += quickSort(leftSide)
        mergedArray += [pivot]
        mergedArray += quickSort(rightSide)
        
        return mergedArray
    }
    
    /*
     *
     *
     *
     */
}