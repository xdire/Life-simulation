//
//  Cell.swift
//  Game Of Life
//
//  Created by Anton Repin on 8/6/16.
//  Copyright © 2016 Anton Repin. All rights reserved.
//

import Foundation

class Cell {
    
    let xCoord: Int;
    let yCoord: Int;
    var phase: CellPhase;
    
    init(x: Int, y: Int) {
        
        self.xCoord = x;
        self.yCoord = y;
        self.phase = CellPhase.initRandom();
        
    }
    
}
