//
//  Life.swift
//  Life
//
//  Created by Anton Repin on 8/6/16.
//  Copyright © 2016 Anton Repin. All rights reserved.
//

import Foundation

class Life {
    
    var cells: [Cell];
    let gridSize: Int = 20;
    
    init() {
        
        cells = [Cell]();
        cells = initCells();
        
    }
    
    //  ---------------------------------------------------------------
    //  Initialize Cells
    //  ---------------------------------------------------------------
    lazy var initCells: () -> [Cell] = {
        
        // Define self as weak for closure
        [weak self] in
        
        var cells = [Cell]();
        
        for xLoc in 0..<self!.gridSize {
            for yLoc in 0..<self!.gridSize {
                cells.append(Cell(x: xLoc, y: yLoc));
            }
        }
        
        return cells;
    }
    
    //  --------------------------------------------------------------
    //  Evolve world to next Tick
    //  --------------------------------------------------------------
    func nextTick() -> Void {
        
        
        
    }
    
    //  --------------------------------------------------------------
    //  Function with full example
    //  --------------------------------------------------------------
    func cellNeighbors(cell: Cell) -> [Cell] {
        
        var neighbors : [Cell] = [];
        
        for cell2 in cells {
            
            if(isCellNeighbor(cell, cell2: cell2)){
                neighbors.append(cell2);
            }
            
        }
        
        return neighbors;
        
    }
    
    //  --------------------------------------------------------------
    //  Function with EXTENSION example
    //  --------------------------------------------------------------
    func getCellNeighbors(cell: Cell) -> [Cell] {
        
        return self.cells.getNeighbors { self.isCellNeighbor(cell, cell2: $0); }
        
    }
    
    //  --------------------------------------------------------------
    //  Function Determines nearby cells
    //  --------------------------------------------------------------
    func isCellNeighbor(cell1: Cell, cell2: Cell) -> Bool {
        
        // Subtract (8 - 7 = 1) for true Or (9 - 6 = 3) for false
        // Take an absolute value (positive only)
        let a: Int = abs(cell1.xCoord - cell2.xCoord);
        let b: Int = abs(cell1.yCoord - cell2.yCoord);
        
        // Switch variant initializer
        // --------------------------
        //            switch (a,b) {
        //            case (1,1),(1,0),(0,1):
        //                isNeighbor = true;
        //            default:
        //                isNeighbor = false;
        //            }
        
        // Range variant initializer
        // --------------------------
        if case (0...1,0...1) = (a,b) where !(a == 0 && b == 0){
            return true;
        }
        
        return false;
        
    }
    
}