//
//  GameBoard.swift
//  GameOfLife
//
//  Created by Robert Faist on 10/16/20.
//  Copyright © 2020 Robert Faist. All rights reserved.
//

import Foundation

class GameBoard {
    let rows: Int
    let cols: Int
    
    var cells = [Cell]()
    
    init(rows: Int, cols: Int) {
        self.cols = cols
        self.rows = rows
        
        setupInitialBoard()
    }
    
    func setupInitialBoard() {
        for x in 0..<rows {
            for y in 0..<cols {
                let state = Int.random(in: 0...3)
                let cell = Cell(state: state == 0 ? .alive : .dead, x: x, y: y)
                cells.append(cell)
            }
        }
    }
    
    func nextGeneration() {
        var updatedCells = [Cell]()
        
        let liveCells = cells.filter { $0.state == .alive }
        
        for cell in cells {
            let livingNeighbors = liveCells.filter { $0.isNeighbor(cell: cell) }
            
            switch livingNeighbors.count {
            case 2...3 where cell.state == .alive:
                updatedCells.append(cell)
            case 3 where cell.state == .dead:
                let liveCell = Cell(state: .alive, x: cell.x, y: cell.y)
                updatedCells.append(liveCell)
            default:
                let deadCell = Cell(state: .dead, x: cell.x, y: cell.y)
                updatedCells.append(deadCell)
            }
        }
        
        cells = updatedCells
    }
}
