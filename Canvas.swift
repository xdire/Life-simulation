//
//  Canvas.swift
//  Life
//
//  Created by Anton Repin on 8/6/16.
//  Copyright © 2016 Anton Repin. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    let life: Life;
    
    // -----------------------------------------------
    //  Constructor
    // -----------------------------------------------
    init(setLife: Life) {
        
        life = setLife;
        super.init(frame: CGRectMake(0, 0, 0, 0));
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext();
        
        for cell in life.cells {
            
            CGContextSetFillColorWithColor(ctx, colorForCell(cell.phase).CGColor);
            
            CGContextAddRect(ctx, frameForCell(cell));
            
            CGContextFillPath(ctx);
            
        }
        
    }
    
    
    func colorForCell(state: CellPhase) -> UIColor {
        
        switch state {
        case .Alive:
            // ------------
            return UIColor(red: 24/255, green: 127/255, blue: 255/255, alpha: 1.0);
        case .Dead:
            // ------------
            return UIColor(red: 95/255, green: 65/255, blue: 55/255, alpha: 1.0);
        case .Fetus:
            // ------------
            return UIColor(red: 0/255, green: 56/255, blue: 153/255, alpha: 1.0);
        }
        
    }
    
    func frameForCell(cell: Cell) -> CGRect {
        
        let dim = CGFloat(self.life.gridSize);
        let cellSize = CGSizeMake(round(self.bounds.width / dim), round(self.bounds.height / dim));
        
        return CGRectMake(round(CGFloat(cell.xCoord) * cellSize.width), round(CGFloat(cell.yCoord) * cellSize.height), cellSize.width, cellSize.height);
        
        
    }
    

}
