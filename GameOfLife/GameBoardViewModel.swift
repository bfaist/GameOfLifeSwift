//
//  GameBoardViewModel.swift
//  GameOfLife
//
//  Created by Robert Faist on 10/17/20.
//  Copyright © 2020 Robert Faist. All rights reserved.
//

import Foundation
import Combine

class GameBoardViewModel: ObservableObject {
    let gridSize: Int
    
    var gameBoard: GameBoard?
    
    @Published var cells = [Cell]()
    
    var rows: Int {
        gridSize
    }
    
    var cols: Int {
        gridSize
    }
    
    init(gridSize: Int = 20){
        self.gridSize = gridSize
        self.gameBoard = GameBoard(rows: gridSize, cols: gridSize)
        self.cells = self.gameBoard?.cells ?? []
    }
    
    func hasCell(row: Int, col: Int) -> Bool {
        let index = row * col
        guard index < cells.count else { return false }
        return true
    }
    
    func cell(row: Int, col: Int) -> Cell {
        guard hasCell(row: row, col: col) else { return Cell(state: .dead, x: row, y: col) }
        let index = row * col
        return cells[index]
    }
    
    func nextGeneration() {
        guard let gameBoard = gameBoard else { fatalError("no gameboard") }
        
        gameBoard.nextGeneration()
        
        self.cells = gameBoard.cells
    }
}
