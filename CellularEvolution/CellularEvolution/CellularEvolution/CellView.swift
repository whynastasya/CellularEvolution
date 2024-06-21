//
//  CellView.swift
//  CellularEvolution
//
//  Created by nastasya on 19.06.2024.
//

import SwiftUI

struct CellView: View {
    let cell: Cell
    
    var body: some View {
        VStack {
            switch cell.state {
                case .alive:
                    AliveCell()
                case .dead:
                    DeadCell()
                case .life:
                    LifeCell()
            }
        }
    }
}
