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
    
    var gameBoard: GameBoard
    
    @Published var cells = [Cell]()
    
    var rows: Int {
        gridSize
    }
    
    var cols: Int {
        gridSize
    }
    
    init(gridSize: Int = 20){
        self.gridSize = gridSize
        self.gameBoard = GameBoard(rows: gridSize, cols: gridSize, boardSetup: GameRandom())
        self.cells = self.gameBoard.cells
    }
    
    func hasCell(row: Int, col: Int) -> Bool {
        cells.first(where: { $0.x == row && $0.y == col }) != nil
    }
    
    func cell(row: Int, col: Int) -> Cell {
        guard let cell = cells.first(where: { $0.x == row && $0.y == col }) else {
            return Cell(state: .dead, x: row, y: col)
        }
        return cell
    }
    
    func nextGeneration() {
        gameBoard.nextGeneration()
        self.cells = gameBoard.cells
    }
}
