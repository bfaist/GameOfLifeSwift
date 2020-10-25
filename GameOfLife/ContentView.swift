//
//  ContentView.swift
//  GameOfLife
//
//  Created by Robert Faist on 10/16/20.
//  Copyright © 2020 Robert Faist. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = GameBoardViewModel(gridSize: 30)
    
    var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ForEach(0..<self.viewModel.rows) { row in
                HStack {
                    ForEach(0..<self.viewModel.cols) { col in
                        if self.viewModel.hasCell(row: row, col: col) {
                            CellView(cell: self.viewModel.cell(row: row, col: col))
                        }
                    }
                }
            }
        }.onReceive(timer) { (time) in
            self.viewModel.nextGeneration()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
