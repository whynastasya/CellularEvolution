//
//  CellularEvolutionViewModel.swift
//  CellularEvolution
//
//  Created by nastasya on 20.06.2024.
//

import Foundation
import SwiftUI

class CellularEvolutionViewModel: ObservableObject {
    @Published var cells: [Cell] = [Cell]()
    @Published var liveCellCount = 0
    @Published var deadCellCount = 0
    
    func addCell() {
        let newState: CellState = Bool.random() ? .alive : .dead
        let newCell = Cell(state: newState)
        cells.insert(newCell, at: 0)
        
        
        if newState == .alive {
            liveCellCount += 1
            deadCellCount = 0
        } else {
            liveCellCount = 0
            deadCellCount += 1
        }
        checkCellAutomatonRules()
    }
    
    private func checkCellAutomatonRules() {
        if liveCellCount == 3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    let newCell = Cell(state: .life)
                    self.cells.insert(newCell, at: 0)
                    self.liveCellCount = 0
                }
            }
        } else if deadCellCount == 3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.cells.removeAll(where: { $0.state == .life })
                    self.deadCellCount = 0
                }
            }
        }
    }
}
