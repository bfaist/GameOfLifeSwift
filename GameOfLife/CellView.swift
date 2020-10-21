//
//  CellView.swift
//  GameOfLife
//
//  Created by Robert Faist on 10/19/20.
//  Copyright © 2020 Robert Faist. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var cell: Cell
    
    var color: Color {
        switch cell.state {
        case .alive:
            return Color.green
        case .dead:
            return Color.black
        }
    }
    
    var body: some View {
        Rectangle().fill(color)
                .frame(width: 5, height: 5, alignment: .center)
                .blur(radius: 2, opaque: false)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(state: .alive, x: 0, y: 0))
    }
}
