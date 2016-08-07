//
//  CellPhase.swift
//  Life
//
//  Created by Anton Repin on 8/6/16.
//  Copyright © 2016 Anton Repin. All rights reserved.
//

import Foundation

enum CellPhase : Int {
    
    case Alive = 0, Fetus, Dead
    
    static func initRandom(noDead: Bool = true) -> CellPhase {
        
        let includeThisTypes: UInt32 = noDead ? 2:3;
        
        guard let phase = CellPhase(rawValue: Int(arc4random_uniform(includeThisTypes))) else {
            return .Fetus;
        }
        
        return phase;
        
    }
    
}