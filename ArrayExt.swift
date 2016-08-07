//
//  ArrayExt.swift
//  Life
//
//  Created by Anton Repin on 8/7/16.
//  Copyright © 2016 Anton Repin. All rights reserved.
//

import Foundation

extension Array {
    
    // Common implementation
    func getNeighbors(predicate: (Element) -> Bool) -> [Element] {
        
        var neighbors: [Element] = [];
        
        for item in self {
            
            let cell = item as Element;
            
            if(predicate(cell)) {
                neighbors.append(cell);
            }
            
            
        }
        
        return neighbors;
        
    }
    
    // Shorthand implementation
    func filterNeighbors(predicate: (Element) -> Bool) -> [Element] {
        
        var filtered: [Element] = [];
        
        for el in self where predicate(el) {
            filtered.append(el);
        }
        
        return filtered;
        
    }
    
}
