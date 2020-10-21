//
//  Cell.swift
//  GameOfLife
//
//  Created by Robert Faist on 10/16/20.
//  Copyright © 2020 Robert Faist. All rights reserved.
//

import Foundation

enum State {
    case dead
    case alive
}

struct Cell: Identifiable {
    let id: UUID = UUID()
    let state: State
    let x: Int
    let y: Int
    
    func isNeighbor(cell: Cell) -> Bool {
        let deltaX = abs(self.x - cell.x)
        let deltaY = abs(self.y - cell.y)
        
        switch (deltaX, deltaY) {
        case (1, 1), (0, 1), (1, 0):
            return true
        default:
            return false
        }
    }
}
