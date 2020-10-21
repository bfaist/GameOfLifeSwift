//
//  GameOfLifeTests.swift
//  GameOfLifeTests
//
//  Created by Robert Faist on 10/16/20.
//  Copyright © 2020 Robert Faist. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {

    func test_isNeighbor() {
        let c1 = Cell(state: .alive, x: 0, y: 0)
        let c2 = Cell(state: .alive, x: 0, y: 1)
        let c3 = Cell(state: .alive, x: 1, y: 0)
        let c4 = Cell(state: .alive, x: 2, y: 2)
        
        XCTAssertTrue(c1.isNeighbor(cell: c2))
        XCTAssertTrue(c1.isNeighbor(cell: c3))
        XCTAssertFalse(c1.isNeighbor(cell: c4))
    }
    
    func test_gameboard() {
        let g1 = GameBoard(rows: 5, cols: 5)
        
        XCTAssertEqual(25, g1.cells.count)
    }
}
