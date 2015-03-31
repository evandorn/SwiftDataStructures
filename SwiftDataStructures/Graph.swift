//
//  Graph.swift
//  SwiftDataStructures
//
//  Created by Evan Dorn on 3/30/15.
//  Copyright (c) 2015 Evan Dorn. All rights reserved.
//

import Foundation

public Class Graph {
    
    // declare a default directed graph
    private var graphTemplate: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        graphTemplate = Array<Vertex>()
        isDirected = true
    }
    
    // Create a new vertex
    func addVertex(#value: String) -> Vertex {
        
        // set the value
        var childVertex: Vertex = Vertex()
        childVertex.value = value
        
        // Add the vertex to the graph template
        graphTemplate.append(childVertex)
        
        return childVertex
    }
    
    // Add an edge to the source vertex
    func addEdge(#source: Vertex, neighbor: Vertex, weight: Int) {
        
        // create a new edge
        var newEdge = Edge()
        
        // Set the default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        println("The neighbor of vertex "
    }
}